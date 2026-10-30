# Example script
# Sydney Coronavirus Analysis
# Written by Laurence Park <lapark@westernsydney.edu.au>
# 11th of May 2021
# Description:
# Analysis of simulated coronavirus data for the Sydney population
# when intervention was not provided.
library("ggplot2")
# load data
d <- read.csv("data/epiSEIHCRD_combAge.csv")
# We find that the time variable is not of type Date
# So it is changed to date type where time 0 is 1/3/2020
d$t <- as.Date(d$t, origin = "2020-03-01")
# The default palette is not suitable for those with colour blindness
# Set the colour palette for plots
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)
dDate <- subset(d, subset = ((t >= "2020-06-01") & (t <= "2020-12-31")))
g <- ggplot(data = dDate) +
  geom_line(mapping = aes(x = t, y = H), color = "red") +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week",
               date_labels = "%B") +
  labs(title = "Hospital beds required (Sydney 2020)", x = "Date", y = "Beds")
print(g)
################################################
## Git commands
git commit -a # commit the changes
git log # view the commit log
4 Branching
The plot is exactly what is needed, but we want to examine if adding
other curves will provide a better plot. We don’t want to change the
existing code, so we will make a branch and work on the new branch.
1. Create a branch in the repository and change to that branch.
version control 4
2. Edit the script to add the number of critical and dead to the plot
and commit the changes.
3. Change the y scale to be a square root scale. Make sure the plot
looks presentable and then commit the changes.
################################################
# Example script
# Sydney Coronavirus Analysis
# Written by Laurence Park <lapark@westernsydney.edu.au>
# 11th of May 2021
# Description:
# Analysis of simulated coronavirus data for the Sydney population
# when intervention was not provided.
library("ggplot2")
# load data
d <- read.csv("data/epiSEIHCRD_combAge.csv")
# We find that the time variable is not of type Date
# So it is changed to date type where time 0 is 1/3/2020
d$t <- as.Date(d$t, origin = "2020-03-01")
# The default palette is not suitable for those with colour blindness
# Set the colour palette for plots
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)
dDate <- subset(d, subset = ((t >= "2020-06-01") & (t <= "2020-12-31")))
g <- ggplot(data = dDate) +
  geom_line(mapping = aes(x = t, y = H, color = "Hospitalised")) +
  geom_line(mapping = aes(x = t, y = C, color = "Critical")) +
  geom_line(mapping = aes(x = t, y = D, color = "Dead")) +
  scale_y_sqrt() +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week",
               date_labels = "%B") +
  labs(title = "Hospital beds required (Sydney 2020)", x = "Date", y = "Count",
       color = "State")
print(g)
################################################
## Git commands
git branch extraPlot
git checkout extraPlot
git commit -a # commit the changes
git log # view the commit log
version control 5
5 Switching branches
You have been asked to update the plot so that the y axis has a log
scale. To do this,
1. Switch back to the master branch, and make the changes.
2. Commit the changes.
3. Check the log.
################################################
## Git commands
git checkout master
################################################
# Example script
# Sydney Coronavirus Analysis
# Written by Laurence Park <lapark@westernsydney.edu.au>
# 11th of May 2021
# Description:
# Analysis of simulated coronavirus data for the Sydney population
# when intervention was not provided.
library("ggplot2")
# load data
d <- read.csv("data/epiSEIHCRD_combAge.csv")
# We find that the time variable is not of type Date
# So it is changed to date type where time 0 is 1/3/2020
d$t <- as.Date(d$t, origin = "2020-03-01")
# The default palette is not suitable for those with colour blindness
# Set the colour palette for plots
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)
dDate <- subset(d, subset = ((t >= "2020-06-01") & (t <= "2020-12-31")))
g <- ggplot(data = dDate) +
  geom_line(mapping = aes(x = t, y = H), color = "red") +
  scale_y_log() +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week",
               date_labels = "%B") +
  labs(title = "Hospital beds required (Sydney 2020)", x = "Date", y = "Beds")
print(g)