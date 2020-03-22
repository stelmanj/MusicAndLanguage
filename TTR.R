library(quanteda)
library(tidyverse)
library(nnet)
library(DescTools)
library(caret)
library(ggplot2)
library(dplyr)
library(stringi)

AFsongDF <- read.csv("AFsongDF.csv", row.names=1)

set.seed(8)
dat <- na.exclude(AFsongDF[,c(-5,-16:-12,-23)])
dat$sid <- as.character(dat$sid)

# files borrowed from Dr David Brown's Text Analysis class at Carnegie Mellon University, Fall 2019
# forked from his course github page
source("https://github.com/stelmanj/textstat_tools/blob/master/functions/keyness_functions.R")
source("https://github.com/stelmanj/textstat_tools/blob/master/functions/dispersion_functions.R")

library(readtext)
library(tidyverse)
library(corpus)


select <- dplyr::select

dat
stri_lang_enc = vapply(1:nrow(dat), function(x){
  stri_enc_detect(
    dat$lyrics[x], filter_angle_brackets = F
    )[[1]][c('Language','Encoding','Confidence')][1,] %>%
    unlist()},
  FUN.VALUE = c('Language','Encoding','Confidence')) %>% t() %>%
  as.data.frame()

# Make the text doc df for corpus analysis

lyrics_df <- dat %>%
  dplyr::select(doc_id = sid, text = lyrics, lang) %>%
  cbind(stri_lang_enc) %>%
  mutate_if(is.factor, as.character) %>%
  filter(Encoding == "ISO-8859-1") %>%
  # if lang.detect said English but R said something else, get rid of it
  dplyr::filter(ifelse(lang != "en", T, ifelse(lang == Language, T, F)))

# And create a corpus object, as always.

lyrics_corpus <- corpus(lyrics_df)

# fetch a summary of the corpus composition, be sure to use all 300, and not just the default 100
lyrics_sum <- summary(lyrics_corpus, tolower = T, n = 902) %>% dplyr::select(- Sentences)

# Corpus composition table
lyrics_sum3ds <- lyrics_sum %>% 
  mutate(Text = as.character(Text)) %>%
  mutate(TTR = Types/Tokens) %>% 
  mutate(Language = lang)

lyrics_sum_cct_avg <- lyrics_sum3ds %>% 
  summarise("Texts" = length(Text),
            "Avg Tokens per Lyric Exerpt" = round(mean(Tokens)),
            "Tokens" = sum(Tokens),
            "Avg Types per Lyric Exerpt" = round(mean(Types),2), 
            "Avg Type/Token Ratio (TTR)" = round(mean(TTR),3)) %>% 
  mutate(Language = "all") %>%
  select(Language, Texts, Tokens, `Avg Tokens per Lyric Exerpt`, `Avg Types per Lyric Exerpt`, `Avg Type/Token Ratio (TTR)`)

lyrics_sum_cct_va <- lyrics_sum3ds %>% group_by(Language) %>% 
  summarise("Texts" = length(Text),
            "Avg Tokens per Lyric Exerpt" = round(mean(Tokens)),
            "Tokens" = sum(Tokens), 
            "Avg Types per Lyric Exerpt" = round(mean(Types),2), 
            "Avg Type/Token Ratio (TTR)" = round(mean(TTR),3)) %>%  ungroup() %>%
  select(Language, Texts, Tokens, `Avg Tokens per Lyric Exerpt`, `Avg Types per Lyric Exerpt`, `Avg Type/Token Ratio (TTR)`)

lyrics_sum_cct_va <- rbind(lyrics_sum_cct_va, lyrics_sum_cct_avg)

lyrics_sum_cct_simp <- lyrics_sum_cct_va  %>%
  select(Language, Texts, Tokens, `Avg Type/Token Ratio (TTR)`)
