
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

grad_rates_clean1$division <- gsub('[^[:alnum:] ]', '', grad_rates_clean1$division, ignore.case = TRUE)

x = grad_rates_clean1$division
grad_rates_clean2 <- gsub("([a-z])([A-Z])", "\\1 \\2", division)

grad_rates_clean1$division <- grad_rates_clean2
grad_rates_clean1$division <- gsub(" Public Schools$", "", grad_rates_clean1$division, ignore.case = TRUE)

grad_rates_clean1$subgroup <- gsub('[^[:alnum:] ]', '', grad_rates_clean1$subgroup, ignore.case = TRUE)

grad_rates_clean1$cohort[grad_rates_clean1$cohort == 'n/a'] <- '0'
grad_rates_clean1$graduation_count[grad_rates_clean1$graduation_count == '<'] <- '0'
grad_rates_clean1$on_time_grad_rate[grad_rates_clean1$on_time_grad_rate == '<'] <- '0'
grad_rates_clean1$completion_count[grad_rates_clean1$completion_count == '<'] <- '0'
grad_rates_clean1$completion_rate[grad_rates_clean1$completion_rate == '<'] <- '0'
grad_rates_clean1$on_time_grad_rate[grad_rates_clean1$on_time_grad_rate == '100'] <- '0'
grad_rates_clean1$completion_rate[grad_rates_clean1$completion_rate == '100'] <- '0'

enrollment_clean1$grade[enrollment_clean1$grade == ''] <- 'total'

grad_rates_clean2 <- grad_rates_clean1[-1,-2]
grad_rates_clean2 <- grad_rates_clean2[-1,]

enrollment_clean_2 <- enrollment_clean %>% select(year, division, grade, count)
enrollment_clean_2$grade[enrollment_clean_2$grade == 'total'] <- 'all'
enrollment_clean_2 <- enrollment_clean_2[-(1:2),]
# done 

# graphs

#renaming all datasets to have the same `county` column name
library(dplyr)
grad_rates_clean2 <- rename(grad_rates_clean2, county = division)
enrollment_clean_2 <- rename(enrollment_clean_2, county = division)
home_sales <- rename(home_sales, county = "County/City")
population_sex_combined <- rename(population_sex_combined, county = "CountyName")
population_sex_combined[population_sex_combined$county == 'city'] <- 'City'
population_sex_combined$county <- gsub(" city", " City", population_sex_combined$county, ignore.case = TRUE)
household_size <- rename(household_size, county = County)

population_sex_combined$county <- gsub("([a-z])([A-Z])", "\\1 \\2", population_sex_combined$county)

grad_rates_clean2 %>% count(county)
home_sales %>% count(county)
owners_renters  %>% count(county)
population_sex_combined  %>% count(county)
sales_prices  %>% count(county)
enrollment_clean_2  %>% count(county)
household_size  %>% count(county)


