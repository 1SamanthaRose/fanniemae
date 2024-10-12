
#Fix errors with grad_rates and enrollment_grade

install.packages("tidyr")
library(tidyr)

grad_rates_clean <- grad_rates_demographics |> 
separate(
  col = `On-time Graduation Rate`,
  into = c("year", "level", "division", "subgroup", "graduation_count", "on_time_grad_rate", "completion_count", "completion_rate"),  
           sep = ",",
           convert = TRUE
  )

enrollment_clean <- enrollment_grade |> 
  separate(
    col = `Enrollment`,
    into = c("year", "level", "division", "grade", "count"),  
    sep = ",",
    convert = TRUE
  )





install.packages("stingr")
library(stringr)


enrollment_clean$division <- gsub(" Public Schools$", "", enrollment_clean$division, ignore.case = TRUE)

install.packages("dplyr")
library(dplyr)
enrollment_clean1 <- enrollment_clean %>% select(division, grade, count)

mutate( make = recode(
  make,
  FOR = "FORD",
  GM = "GMC",
  HARL = "HD",
  JAG = "JAGU",
  LAND = "LNDR",
  MERD = "MERC",
  MINI = "MNNI",
  MIST = "MITS",
  4
  PONY = "PONT",
  RAMS = "RAM",
  ROYC = "ROL",
  SATR = "STRN",
  SATU = "STRN",
  TOYO = "TOYT",
  VW = "VOLK"
))