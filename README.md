# MusicAndLanguage
Exploring connections between audio features and lyric language in music.

### Abstract

This project is a study of underlying correlation between lyric language various audio features in music, and connections between linguistic families of language that manifest in music. Incorporating data from the several sources and tools from several python and R packages and APIs (detailed in the next paragraph), the project involves language recognition, text processing, and data visualization. 

### Data

Over four thousand songs in over forty different languages are being used so far in this study. With help from the Spotify Web API (for audio feature collection), Musixmatch API (for lyric collection), and the python port of Google's language-detection library, available on Github, I was able to begin exploring the connections between lyric language and audio features in music. My list of songs came from published playlists on Spotify by the user *The Sounds of Spotify*. This user does a lot of really neat music data mapping projects, and shares them on his site: http://everynoise.com. 

### Disclaimer:

I make absolutely zero promises that any of my results have any meaning in linguistics. I have never taken a linguistics course, and never most of the languages I am examining in this study. Linguistics professors with whom I discussed this project after completing it had some doubts about my choice of Type/Token ratio as a metric for languages other than English. Using TTR, as I did in A_Brief_Analysis_of_Lyric_Text_Metrics_in_5_Languages and Audio_Features_and_Lyric_Spread_Metrics, introduced the unjustified assumption that all languages use spaces in the same way. 

I emphasise that, in A_Brief_Analysis_of_Lyric_Text_Metrics_in_5_Languages, the focus should not be on how TTR behavior differs by language. Instead, it should be on how the *average* TTR of a language's lyric exerpts differs from the *total* TTR of that language's combined lyric excerts, and how that difference is different for different languages.

In Audio_Features_and_Lyric_Spread_Metrics, note that I don't use TTR itself as a metric for analysis. Rather, I use spread metrics of TTR, and nine other features simultaneously, to investigate my research question. 

### Acknowledgements:

Special thanks to CMU professors Brian Junker, David Brown, and Susan Buchman, and University of Pittsburgh professors Na-Rae Han and Gretchen Aiyangar who helped me to varying degrees thoughout the course of this project. A second thanks to David Brown for his textstat_tools repository, which I forked and referenced a few times throughout this project. And an extra special second thanks to Brian Junker for voluntarily taking on the role of my part-time advisor for this project. (I know I still haven't done all the things you suggested but I appreciated all the advice you gave me.)

A big thank you to Spotify for their web API, Musixmatch for their song lyric API, the authors of the *langdetect* python library for their language detection help, and Glenn McDonald for making everynoise.com and giving me an easy starting point for figuring out a list of songs to search. 