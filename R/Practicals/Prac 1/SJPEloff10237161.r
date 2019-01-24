# SJP Eloff (10237161) 
# Practical 2
# STK 353 (2018)

library(ggplot2)
library(tidyverse)
library(dplyr)
library(nycflights13)

### FILTER
#Q_1a
?flights
flights %>% filter(arr_delay >= 120)

#Q_1b
flights %>% filter(dest == 'IAH'|dest == 'HOU')

#Q_1c
a?rlines
flights %>% filter(carrier == 'UA'|carrier == 'AA'|carrier == 'DL')

#Q_1d
flights %>% filter(month == 7|month == 8|month == 9)

#Q_1e
flights %>% filter(dep_delay <= 0, arr_delay > 2)

#Q_1f
flights %>% filter(dep_delay >= 1, arr_delay < (dep_delay?0.5))

#Q_1g
flights %>% filter(dep_time <= 600|dep_time == 2400)

#Q_2a
?between

#Q_2b
flights %>% filter(between(dep_time, 0, 600))

#Q_3a
?is.na
sum(is.na(flights$dep_time))

#Q_3b
colnames(flights)[colSums(is.na(flights))>0]

###ARRANGE
#Q_5
?arrange
?lights %>% arrange(desc(is.na(dep_time)), desc(is.na(dep_delay)),
                    desc(is.na(arr_time)), desc(is.na(arr_delay)),
                    desc(is.na(tailnum)),desc(is.na(air_time)))

#Q_6
arrange(flights, desc(dep_delay))
arrange(flights, de?_delay)

#Q_7
arrange(flights, air_time)

#Q_8
arrange(flights, desc(distance))
arrange(flights, distance)

###MUTATE
#Q_9
flights %>% mutate(dep_time = (dep_time %/% 100) * 60 + 
                              (dep_time %% 100),
                   sched_de?_time = (sched_dep_time %/% 100) * 60 +
                                    (sched_dep_time %% 100))

#Q_10
flights %>% mutate(arr_time = (arr_time %/% 100) * 60 + 
                              (arr_time %% 100)) %>% 
            transmute((arr_time - dep?time) - air_time)

#Q_11
flights %>% transmute((dep_time - sched_dep_time) - dep_delay)

#Q_12
?min_rank
filter(flights, min_rank(desc(dep_delay)) <= 10)

#Q_13
1:3 + 1:10

#Q_14
?Trig

###SUMMARIZE
#Q_15
analysis <- flights %>%
            group_by(dest) ?>%
            summarise(meandist = mean(distance, na.rm = TRUE),
                      meandelay = mean(arr_delay, na.rm = TRUE),
                      total = n()) %>%
            filter(total > 20, dest != 'HNL')
ggplot(analysis, aes(x = meandist, y = m?andelay, size = total)) +
  geom_point()

#Q_16.1
analysis <- flights %>%
  group_by(carrier) %>%
  summarise(meandelay = mean(arr_delay, na.rm = TRUE),
            total = n()) %>%
  filter(total > 20)
ggplot(analysis, aes(x = carrier, y = meandelay, size?= total)) +
  geom_point()

#Q_16.2
analysis <- flights %>%
  group_by(month) %>%
  summarise(meandelay = mean(arr_delay, na.rm = TRUE),
            total = n()) %>%
  filter(total > 20)
ggplot(analysis, aes(x = month, y = meandelay, size = total)) +
  geo?_point()

#Q_16.3
analysis <- flights %>%
  group_by(arr_time) %>%
  summarise(meandelay = mean(arr_delay, na.rm = TRUE),
            total = n()) %>%
  filter(total > 20)
ggplot(analysis, aes(x = arr_time, y = meandelay, size = total)) +
  geom_point()

#?_16.4
analysis <- flights %>%
  group_by(dep_time) %>%
  summarise(meandelay = mean(arr_delay, na.rm = TRUE),
            total = n()) %>%
  filter(total > 20)
ggplot(analysis, aes(x = dep_time, y = meandelay, size = total)) +
  geom_point()

#Q_16.5
analy?is <- flights %>%
  group_by(day) %>%
  filter(dep_delay > 0) %>%
  summarise(total = n()/12, meandelay = mean(arr_delay, na.rm = TRUE))
ggplot(analysis, aes(x = day,y = total)) +
  geom_point()
ggplot(analysis, aes(x = day,y = meandelay)) +
  geom_line()
?#Q_17
flights %>%
  mutate(dep_date = lubridate::make_datetime(year, month, day)) %>%
  group_by(dep_date) %>%
  summarise(cncld = sum(is.na(dep_delay)), 
            k = n(),
            meandepdelay = mean(dep_delay, na.rm=TRUE),
            meanarrdelay?= mean(arr_delay, na.rm=TRUE)) %>%
  ggplot(aes(x = cncld/k)) + 
  geom_point(aes(y = meandepdelay), color = 'blue') + 
  geom_point(aes(y = meanarrdelay), color = 'red')