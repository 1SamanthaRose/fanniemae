

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



#visualisations

library(ggpubr)
library(scales)
library(ggplot2)


ggscatter(sales_tenancy, x = "tenant", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Home Renters", ylab = "Average Sales Price of Home",
          xlim = c(0,20000))
            #ffx co is outlier with 126k renters

ggscatter(sales_tenancy, x = "total.households", y = "price", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "kendall",
          xlab = "Total Households", ylab = "Average Sales Price of Home",
          xlim = c(0, 60000), scale_y_continuous(labels = comma))

