

#READING IN THE DATA
labor_unemployment = read.csv("Labor_unemployment.csv", header = TRUE)
median_income = read.csv("median_income.csv", header = TRUE)
home_sales = read_excel("home_sales.xlsx")
household_size = read_excel("household_size.xlsx")
owners_renters = read.csv("owners_renters.csv", header = TRUE)
pop_sex_age = read.csv("population_sex_age.csv", header = TRUE)
home_sale_prices = read_excel("sales_prices.xlsx")

#fixing rows

home_sales = select(home_sales, -c(3:14))

home_sale_prices = select(home_sale_prices, -c(3:105))

