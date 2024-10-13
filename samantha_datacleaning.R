

#READING IN THE DATA

owners_renters = read.csv("owners_renters.csv", header = TRUE)
home_sale_prices = read_excel("sales_prices.xlsx")



#last bit of pre-processing
library(tidyverse)
home_sale_prices = home_sale_prices %>%
                    rename(
                      price = ...2
                    )
#merge datasets
sales_tenancy = merge(home_sale_prices, owners_renters, by = "county")

#create new variable, percentage of home owners and percentage of home renters

sales_tenancy = sales_tenancy %>%
                  mutate(owner / total.households)

sales_tenancy = sales_tenancy %>%
      mutate(tenant / total.households)

sales_tenancy = sales_tenancy %>%
      rename("percent_renting" = "tenant/total.households", 
             "percent_owners" = "owner/total.households")


#visualisations

library(ggpubr)
library(scales)
library(ggplot2)


ggscatter(sales_tenancy, x = "percent_renting", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Home Renters", ylab = "Average Sales Price of Home",
          )

ggscatter(sales_tenancy, x = "total.households", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Total Households", ylab = "Average Sales Price of Home",
          xlim = c(0, 50000))

ggscatter(sales_tenancy, x = "percent_owners", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Home Owners", ylab = "Average Sales Price of Home",
)

