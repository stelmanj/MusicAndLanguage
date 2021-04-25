# MusicAndLanguage
Exploring connections between audio features and lyric language in music.

### Abstract

This project is a study of underlying correlation between lyric language, various audio features in music, and widespokenness of lyric language that manifest in music. Incorporating data from several sources and tools from several python and R packages and APIs (detailed in the next paragraph), the project involves language recognition, text processing, hypothesis testing, and data visualization. 

### Data

After webscraping the metadata for over four thousand songs in over forty different languages, a 100-song subset, spanning 5 different languages, was chosen for this study. With help from the Spotify Web API (for audio feature collection), the Musixmatch API (for lyric collection), and the python port of Google's language-detection library, available on Github, I was able to begin exploring the connections between lyric language and audio features in music. My list of songs came from playlists on Spotify published by the user *The Sounds of Spotify*. This user does a lot of really neat music data mapping projects, and shares them on his site: http://everynoise.com. 

### Contents:

* **DataPreparation.ipynb** Summarizes the process of collecting the data in python to make *AFsongDF.csv*. I sample 20 songs in each of 5 different languages and use `quanteda` to gather some metadata about songs' lyric excerpts. I create 3 neat dataframes, *Bat1_lsum_avgd.csv*, *Bat2_lsum_cat.csv*, and *AFS_esinw.csv* for use in the next two chapters. **R libraries used** `dplyr`, `quanteda`, `stringi`.

* **A_Brief_Analysis_of_Lyric_Text_Metrics_in_5_Languages.ipynb** On the data in *Bat1_lsum_avgd.csv* and *Bat2_lsum_cat.csv*, I do some brief EDA on type counts, token counts, and type/token ratios (TTRs) of lyric excerpts. For each of the 5 languages, I do this on the 20 songs' lyrics, both individually and bagged, and then perform language by language comparisons. **R libraries used** `dplyr`.

* **Audio_Features_and_Lyric_Spread_Metrics.ipynb** On the data in *AFS_esinw.csv*, I look at the distributions and spread metrics of Spotify Audio Features and TTRs for the songs in each language. Do songs in more widely spoken languages vary more in their characteristics than songs in less widely spoken languages? I perform Rank Sum tests and k-means clustering on standard deviations and IQRs of the languages' songs' features to crudely explore this question. **R libraries used** `tidyverse`, `ggridges`, `cluster`, `factoextra`, `parallel`.

### Disclaimer:

I make absolutely zero promises that any of my results have any meaning in linguistics. I have never taken a linguistics course, and never studied most of the languages I am examining in this study. Linguistics professors with whom I discussed this project after completing it had some doubts about my choice of Type/Token ratio as a metric for languages other than English. Using TTR, as I did in A_Brief_Analysis_of_Lyric_Text_Metrics_in_5_Languages and Audio_Features_and_Lyric_Spread_Metrics, introduces the unjustified assumption that all languages use spaces in the same way. 

I emphasise that, in A_Brief_Analysis_of_Lyric_Text_Metrics_in_5_Languages, the focus should not be on how TTR behavior differs by language. Instead, it should be on how the *average* TTR of a language's lyric exerpts differs from the *total* TTR of that language's combined lyric excerts, and how that difference is different for different languages.

In Audio_Features_and_Lyric_Spread_Metrics, note that I don't use TTR itself as a metric for analysis. Rather, I use spread metrics of TTR, and nine other features simultaneously, to investigate my research question. 

### Acknowledgements:

Special thanks to Carnegie Mellon University professors Brian Junker, David Brown, and Susan Buchman, and University of Pittsburgh professors Na-Rae Han and Gretchen Aiyangar who helped me to varying degrees thoughout the course of this project. A second thanks to David Brown for his textstat_tools repository, which I forked and referenced a few times throughout this project. And an extra special second thanks to Brian Junker for voluntarily taking on the role of my part-time advisor for this project. (I know I still haven't done all the things you suggested but I appreciated all the advice you gave me.)

A big thank you to Spotify for their web API, Musixmatch for their song lyric API, the authors of the *langdetect* python library for their language detection help, and Glenn McDonald for making everynoise.com and giving me an easy starting point for figuring out a list of songs to search. 
