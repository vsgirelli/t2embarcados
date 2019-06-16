library(magrittr);
library(readr);
library(dplyr);
library(ggplot2);

df <- as.data.frame(read_csv("./ALL_results.csv"))

adf <- df %>%
  filter(CLASS == 'A') %>%
  group_by(THREADS) %>%
  summarize(mean_t = mean(SECONDS), mean_e = mean(ENERGY))

write.csv(adf, file = "A_means_df.csv")

bdf <- df %>%
  filter(CLASS == 'B') %>%
  group_by(THREADS) %>%
  summarize(mean_t = mean(SECONDS), mean_e = mean(ENERGY))

write.csv(bdf, file = "B_means_df.csv")

cdf <- df %>%
  filter(CLASS == 'C') %>%
  group_by(THREADS) %>%
  summarize(mean_t = mean(SECONDS), mean_e = mean(ENERGY))

write.csv(cdf, file = "C_means_df.csv")
