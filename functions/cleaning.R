cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments)
}

remove_empty_culmen_data <- function(data_clean){
  data_clean %>%
    filter(!is.na(flipper_length_mm)) %>%
    filter(!is.na(body_mass_g)) %>%
    select(species, body_mass_g, culmen_length_mm)
}



# Save the plot as a png and define the size, resolution, and scaling

# Custom file for creating png files:
save_beak_plot_png <- function(penguins_culmen, filename, size, res, scaling){
  agg_png(filename, width = size, 
          height = size, 
          units = "cm", 
          res = res, 
          scaling = scaling)
  penguin_beak_plot <- plot_beak_plot(penguins_culmen)
  print(penguin_beak_plot)
  dev.off()
}



# Custom file for creataing png files:
save_beak_plot_svg <- function(penguins_culmen, filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
  penguin_beak_plot <- plot_beak_plot(penguins_culmen)
  print(penguin_beak_plot)
  dev.off()
}

