
#Fix errors with grad_rates and enrollment_grade

install.packages("tidyr")
library(tidyr)

grad_rates_clean1 <- grad_rates_demographics |> 
separate(
  col = `On-time Graduation Rate`,
  into = c("year", "level", "division", "subgroup", "cohort", "graduation_count", "on_time_grad_rate", "completion_count", "completion_rate"),  
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

grad_rates_clean1$division <- gsub(" Public Schools$", "", grad_rates_clean1$division, ignore.case = TRUE)

