### Script name: cleaning.R
###
### Purpose of script: Contains the cleaning functions needed for 
### penguin_assignment.Rmd and functions to save the plots as png and svg
###
### Date Created: 04/12/2022


# The function 'cleaning' cleans column names, removes empty rows, removes columns called comment and delta

cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments)
}

# The function 'remove_empty_culmen_datawhich subset the data to remove missing 
# data and only include culmen length, culmen depth and species

remove_empty_culmen_data <- function(data_clean){
  data_clean %>%
    filter(!is.na(flipper_length_mm)) %>%
    filter(!is.na(body_mass_g)) %>%
    select(species, body_mass_g, culmen_length_mm)
}


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


# Custom file for creataing svg files:
save_beak_plot_svg <- function(penguins_culmen, filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width = size_inches, height = size_inches, scaling = scaling)
  penguin_beak_plot <- plot_beak_plot(penguins_culmen)
  print(penguin_beak_plot)
  dev.off()
}

