### Script name: plotting.R
###
### Purpose of script: Contains the plotting function needed to for doing the 
### figures in penguin_assignment.Rmd
###
### Date Created: 04/12/2022


plot_beak_plot <- function(penguins_culmen) {
  penguins_culmen %>%
    ggplot(aes(x = body_mass_g, y = culmen_length_mm, colour = species, shape = species), alpha = 0.05) +
    geom_point(alpha = 0.7) +
    geom_smooth(method = "lm", se = TRUE) +
    theme_bw() +
    labs(x = "\nBody mass (g)", y = "Beak length (mm)\n", colour = "Penguin species", shape = "Penguin species", title = "Regression between penguin bodymass and beak length", subtitle = "Bill length and body mass for Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER") +
    scale_color_manual(values = c("dodgerblue","darkorange2","darkorchid4"))
}

plot_beak_plot(penguins_culmen)

