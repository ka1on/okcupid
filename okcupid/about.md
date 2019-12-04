## About Page

### Introduction
OKCupid is a popular dating app with over 50 million users, 10 million of which use the app daily. A staggering 1.6 billion swipes occur daily and around 1.5 million OKCupid dates occur per week. Originally launched on college campuses, OkCupid is a popular medium for dating interactions for Harvard students. As a user myself, it seems that there are many insights to gain from approaching OKCupid using a data science lenses.

### Data
I downloaded this data from an open github dataset available here: https://github.com/rudeboybert/JSE_OkCupid. This dataset was published by the Journal of Statistics Education in 2015. The dataset provides user-level profiles of approximately 60,000 users of the dating app OkCupid. I downloaded the raw csv file, moved it into the project directory, and loaded it into R. Because the data is so extensive, I have not included a glimpse() or head() of the data.

OkCupid data is has 60,000 user profiles from California in 2017. OKCupid profiles include several essay questions, preferences, and demographic details. 

From this project, I'll focus on the profiles. Specifically, I'll look bios. I will visualize patterns in common words between males and females and also examine how other personal traits may influence influence the contents of a bio. I use sentiment analysis to measure the contents of a bio, measuring positive and negative sentiment, and 8 different emotions expressed.

### About Me
My name is Katie Cao. I am a Junior at Harvard College studying Economics with a secondary in Psychology. I developed an interest in data analysis after working in the digital marketing/targeted advertising space.