require(magrittr)
require(tidyverse)
source("https://raw.githubusercontent.com/lukereding/random_scripts/master/plotting_functions.R")


df <- tibble::frame_data(~skill, ~rating, ~group,
                         "R", 4, 1,
                         "Python", 3,1,
                         "bash", 2,1,
                         "visualization", "4",1,
                         "machine\nlearning", "3",1,
                         "statistics", 4, 1
)

df %>%
  arrange(skill) %>%
  ggplot(aes(x = skill, y = rating, group = group)) +
  geom_polygon(fill=NA, size = 1.5, color = "black") +
  # coord_cartesian(ylim = c(0,5)) +
  coord_radar() +
  xlab("") +
  theme_minimal() +
  guides(color = guide_legend(ncol=2)) +
  theme(panel.grid.major.x = element_line(color = "grey50", size = 0.3), 
        panel.grid.major.y = element_line(color = "grey50", size = 0.3),
        axis.line.y = element_line(),
        axis.line.x = element_blank(),
        axis.text.x = element_text(size = 12, color = "grey20")) 
ggsave(filename = "~/Desktop/test.svg", width=2, height=2)
