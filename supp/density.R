library(ggplot2)
library(wesanderson)

data <- read.csv("qdata.csv", header = TRUE, as.is = TRUE)

maxl <- qdata$length
site <- qdata$sitename

## Density plots for _variable_ ~ _group_

# density plot for maxl by site
ggplot(data, aes(x = length, fill = sitename, colour = sitename)) +
  geom_density(alpha = .5) +
  scale_fill_manual(values = wes_palette("Cavalcanti1")) +
  scale_colour_manual(values = wes_palette("Cavalcanti1")) +
  xlim(0,350) +
  labs(x = 'Max Length', y = 'density')

# density plot for maxl by mort
ggplot(data, aes(x = length, fill = mortuary, colour = mortuary)) +
  geom_density(alpha = .5) +
  scale_fill_manual(values = wes_palette("Cavalcanti1")) +
  scale_colour_manual(values = wes_palette("Cavalcanti1")) +
  xlim(0,350) +
  labs(x = 'Max Length', y = 'density')
