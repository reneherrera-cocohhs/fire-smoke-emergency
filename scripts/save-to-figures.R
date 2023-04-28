source("scripts/setup.R")

# plot 
essence_data %>%
  mutate(
    date = as.Date(date) #,
    # lineLabel = factor(case_when(
    #   str_detect(lineLabel, "Smoke Inhalation") ~ "[Smoke Inhalation]",
    #   TRUE ~ as.character(lineLabel)
    # ))
  ) %>%
  ggplot(mapping = aes(
    x = date,
    y = count,
    color = lineLabel,
    group = lineLabel
  )) +
  geom_vline(
    xintercept = as.Date("2022-06-12"),
    color = "red",
    size = 2,
    alpha = 3/7
  ) +
  # geom_vline(
  #   xintercept = as.Date("2022-04-19"),
  #   color = "red",
  #   size = 2,
  #   alpha = 3/7
  # ) +
  geom_line() +
  geom_point() +
  scale_x_date(
    date_breaks = "7 days",
    date_minor_breaks = "1 day",
    date_labels = "%m-%d"
  ) +
  labs(
    title = "FMC Respiratory ED Visits RE Pipeline Fires",
    x = "Date",
    y = "Count",
    color = "CC DD Category",
    caption = "Vertical line indicates start date of Pipeline fire"
  ) +
  theme_minimal() +
  theme(
    aspect.ratio = 9/16,
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  )

ggsave(
  filename = "figures/pipeline-fire.png"
)
