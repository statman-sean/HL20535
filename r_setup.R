# Install required packages (only if not already installed)
packages <- c("tzdb", "lubridate", "timechange", "tidyverse", "psych", 
              "afex", "emmeans", "effectsize", "knitr", "ggplot2", 
              "readxl", "janitor", "ggpubr", "pwr")

new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

# Load all required libraries
library(tzdb)
library(lubridate)
library(timechange)
library(tidyverse)
library(psych)
library(afex)
library(emmeans)
library(effectsize)
library(knitr)
library(ggplot2)
library(readxl)
library(janitor)
library(ggpubr)
library(pwr)

# Download and import the Excel file
temp_file <- tempfile(fileext = ".xlsx")
download.file(
  "https://raw.githubusercontent.com/statman-sean/HL20535/main/df.xlsx",
  destfile = temp_file,
  mode = "wb",
  method = "libcurl"
)

# Read the data and clean variable names
df <- read_excel(temp_file) %>%
  clean_names() %>%
  mutate(cohort = as.factor(cohort))

# Quick check
head(df)
str(df)
summary(df)
