
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
