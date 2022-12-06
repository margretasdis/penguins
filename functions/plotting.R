plot_beak_plot <- function(penguins_culmen) {
  penguins_culmen %>%
    ggplot(aes(x = body_mass_g, y = culmen_length_mm, colour = species, shape = species), alpha = 0.05) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", se = TRUE) +
    theme_bw() +
    labs(x = "\nBody mass (g)", y = "Beak length (mm)\n", colour = "Penguin species", shape = "Penguin species", title = "Relationship between penguin bodymass and beak length", subtitle = "Bill length and body mass for Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER") +
    scale_color_manual(values = c("dodgerblue","darkorange2","darkorchid4"))
}

plot_beak_plot(penguins_culmen)

