library(ggplot2)
library(dplyr)
library(stringr)
library(tidytext)
library(XML)
library(janitor)
library(fs)
library(tidyverse)
library(okcupiddata)
library(syuzhet)
data(profiles)
profiles <- as.data.frame(profiles)

words <- data.frame(text= profiles$essay0, sex= profiles$sex, stringsAsFactors = FALSE) %>%
  filter(!is.na(text))

text_df <- mutate(words, text = words$text, sex = words$sex)

str(words)

each_word <- text_df %>%
  unnest_tokens(word, text) %>%
  select(word)

senti <- text_df %>%
  unnest_tokens(word, text) %>%
  group_by(gender) %>%
  mutate(linenumber = row_number())%>%
  ungroup()

data(stop_words)

senti <- senti %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) 

bing <- each_word %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment) %>%
  group_by(sentiment) %>%
  top_n(10) %>%
  ungroup() 

emotions <- get_nrc_sentiment(as.character(profiles$essay0))

top_10 <- bing %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free") +  
  coord_flip()



write_rds(all_words, "okcupid/all_words.rds")
write_rds(top_10, "okcupid/top_10.rds")
write_rds(words, "okcupid/words.rds")
