read.csv("~//Downloads//OASIS2.csv")

#Linear regression using read.csv() before profiling
start_time <- system.time({
  oasis_csv <- read.csv("~//Downloads//OASIS2.csv")
  model_readcsv <- lm(MMSE ~ nWBV + Age, data = oasis_csv)
})

summary(model_readcsv)
start_time

#Linear regressiion using fread() before profiling
library(data.table)

start_time_fread <- system.time({
  oasis_fread <- fread("~//Downloads//OASIS2.csv")
  model_fread <- lm (MMSE ~ nWBV + Age, data = oasis_fread)
})

summary(model_fread)
start_time_fread

#Profiling
library(profvis)

profvis({
  oasis_csv <- read.csv("~//Downloads//OASIS2.csv")
  Sys.sleep(0.5)
  lm(MMSE ~ nWBV + Age, data = oasis_csv)
})

library(data.table)
library(profvis)

profvis({
  oasis_fread <- fread("~//Downloads//OASIS2.csv")
  Sys.sleep(0.5)
  lm(MMSE ~ nWBV + Age, data = oasis_fread)
})

profvis({
  oasis_csv <- read.csv("~//Downloads//OASIS2.csv")
  for (i in 1:50) {
    lm(MMSE ~ nWBV + Age, data = oasis_csv)
  }
})
