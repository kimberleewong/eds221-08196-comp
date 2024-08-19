rm(list = ls())

wb_indicators <- read_csv(here("data", "wb_indicators.csv"), na = c("..", ""))

wb_tidy <- wb_indicators %>%
  tidyr::pivot_longer(cols = "2001 [YR2001]":"2020 [YR2020]", #which to squish
                                    names_to = "year",
                                    values_to = "indicator_value") %>%
  tidyr::separate(col = year, into = c("year", "year_chr"), sep = " ") %>%
  dplyr::mutate(year = as.numeric(year)) %>%
  dplyr::select(-year_chr, -"Country Code", -"Series Code") %>%
  drop_na("Series Name") %>%
  pivot_wider(names_from = "Series Name",
              values_from = indicator_value) %>%
  dplyr::rename(country = 'Country Name',
                year = 'year',
                clean_fuels = 'Access to clean fuels and technologies for cooking (% of population)',
                access_elec = 'Access to electricity (% of population)',
                co2 = 'CO2 emissions (kt)',
                fossil_fuels = 'Fossil fuel energy consumption (% of total)',
                water_stress = 'Level of water stress: freshwater withdrawal as a proportion of available freshwater resources')








