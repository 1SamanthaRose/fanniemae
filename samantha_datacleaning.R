


#READING IN THE DATA
labor_unemployment = read.csv("Labor_unemployment.csv", header = TRUE)
median_income = read.csv("median_income.csv", header = TRUE)
home_sales = read_excel("home_sales.xlsx")
household_size = read_excel("household_size.xlsx")
owners_renters = read.csv("owners_renters.csv", header = TRUE)
pop_sex_age = read.csv("population_sex_age.csv", header = TRUE)
home_sale_prices = read_excel("sales_prices.xlsx")
traffic = read_excel("traffic.xls")
    
    #issues reading in data
          #more columns than column names
grad_rates = read.csv("grad_rates_demographics.csv", header = TRUE)
enrollment_grade = read.csv("enrollment_grade.csv", header = TRUE)



#Cleaning Data

    #home sale prices
home_sale_prices = select(home_sale_prices, Monthly Median Sales Prices ($) by County/Independent City, 2016 - present)
