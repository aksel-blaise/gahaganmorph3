library(ggplot2)
library(wesanderson)

data <- read.csv("qdata.csv", header = TRUE, as.is = TRUE)

maxl <- qdata$length
site <- qdata$sitename

## Density plots for _variable_ ~ _group_

# density plot for maxl by site
ggplot(data, aes(x = length, fill = sitename, colour = sitename)) +
  geom_density(alpha = .5) +
  scale_fill_manual(values = wes_palette("IsleofDogs1")) +
  scale_colour_manual(values = wes_palette("IsleofDogs1")) +
  xlim(0,350) +
  labs(x = 'Max Length', y = 'density')

# density plot for maxl by mort
ggplot(data, aes(x = length, fill = mortuary, colour = mortuary)) +
  geom_density(alpha = .5) +
  scale_fill_manual(values = wes_palette("IsleofDogs1")) +
  scale_colour_manual(values = wes_palette("IsleofDogs1")) +
  xlim(0,350) +
  labs(x = 'Max Length', y = 'density')

# density plot for maxl by context
ggplot(data, aes(x = length, fill = context, colour = context)) +
  geom_density(alpha = .5) +
  scale_fill_manual(values = wes_palette("IsleofDogs1")) +
  scale_colour_manual(values = wes_palette("IsleofDogs1")) +
  xlim(0,350) +
  labs(x = 'Max Length', y = 'density')


## Barplot

1 <- ggplot(data, aes(x = length)) +
            geom_histogram(binwidth = 1, fill="#69b3a2", color="#e9ecef", alpha=0.9)

2 <- ggplot(data, aes(x = length)) +
            geom_histogram(binwidth = 2, fill="#69b3a2", color="#e9ecef", alpha=0.9)

3 <- ggplot(data, aes(x = length)) +
            geom_histogram(binwidth = 3, fill="#69b3a2", color="#e9ecef", alpha=0.9)

3 <- ggplot(data, aes(x = length)) +
            geom_histogram(binwidth = 3, fill="#69b3a2", color="#e9ecef", alpha=0.9)
