# Take Home Quiz

# --
# Question 1
# Write a R program to convert given dataframe column(s) to a vector (4mks)
# https://www.statology.org/convert-data-frame-column-to-vector-r/
# --

question_1.color = c("red", "yellow", "green", "blue")
question_1.numbers = c(10, 22, 11, 5)

# creating the dataframe with column names
question_1.df = data.frame(
  colors = question_1.color, 
  numbers = question_1.numbers
)

# printing out the dataframe
question_1.df

# accessing the dataframes via the column names
question_1.color_column = question_1.color
question_1.number_column = question_1.numbers

typeof(question_1.color_column)
typeof(question_1.number_column)

# --
# Question 2
# Write a R program to create a matrix from a list of given vectors (5mks)
# --
# installing the purrr package
install.packages("purrr")
library(purrr)

vec1_age = c(34,40,30,23,21,24,44,60,90,94)
vec2_height = c(1.7,1.65,1.2,1.69,1.51,1.36,2.37,2.08,1.5,1.6)
vec3_gender = c("M", "F" , "F", "F", "F" , "F" , "F" , "M" , "M", "M")

# converting the gender into numbers
# M -> 1
# F -> 2
# https://www.statology.org/map-function-in-r/
vec3_gender_numbers = vec3_gender %>% map(function(g) if(g == "M") 1 else 2)

# asserting that all vectors are equal length
stopifnot(all.equal(length(vec1_age), length(vec2_height), length(vec3_gender)))

question_2.matrix = matrix(
  c(vec1_age, vec2_height, vec3_gender), 
  nrow = 10, 
  ncol = 3,
)
question_2.matrix


# --
# Question 3
# Given the shared Excel dataset ( Ngara_district dataset); (18 Mks)
# --

# loading the data
if (!require(readxl)) {
  install.packages("readxl")
}
library(readxl)

if (!require(ggplot2)) {
  install.packages("tidyverse")
}
library(ggplot2)

question_3.df = readxl::read_excel("ngara_district_dataset.xlsx")

# a) Write a R program to create a simple histogram for second and third column
ggplot(question_3.df)

ggplot(question_3.df) +
  aes(x =`Total Rural population`) +
  geom_histogram()

ggplot(question_3.df) +
  aes(x = question_3.df$`Population_with_ Clean Water`) +
  geom_histogram() +
  xlab("Population with clean water")


# b) Rename the three dataframe columns after “ward” to “A”, “B”, “C”
names(question_3.df)

if (!require(dplyr)) { install.packages("dplyr") }
question_3.df_rename = question_3.df %>% dplyr::rename(
  "A" = "Total Rural population",
  "B" = "Population_with_ Clean Water",
  "C" = "Percent Population Served with Clean Water",
)

names(question_3.df_rename)


# c) Write a R program and display a line plot for column B and C as X &Y axis respectively
# d) Label the Line plot as “Total Rural population vs Population with_ Clean Water”
ggplot(question_3.df_rename) +
  aes(x = B, y = C) +
  geom_line() +
  xlab("Total Rural population") +
  ylab("Population with_ Clean Water") +
  ggtitle("Total Rural population vs Population with_ Clean Water")


# e) Remove the variable 'C' and display the top 6 rows of the data frame.
# I think this means we remove the column C
# https://www.tutorialspoint.com/how-to-remove-a-column-from-an-r-data-frame
question_3.df_rename_no_C = subset(question_3.df_rename, select = -C)
question_3.df_rename_no_C
head(question_3.df_rename_no_C, n = 6L) # ?head


# f) Add another column “D” to the data frame which is “A-B” =D
# https://www.statology.org/r-add-column-to-data-frame-based-on-other-columns/
# https://www.geeksforgeeks.org/how-to-add-a-column-based-on-other-columns-in-r-dataframe/
question_3.df_rename_no_C$D = with(question_3.df_rename_no_C, A - B)
question_3.df_rename_no_C

# g) Write a R program to drop ward “Kabanga” and “Bukiriro” from “ward” column
# https://www.statology.org/remove-rows-in-r/
question_3.df_remove_rows = subset(
  question_3.df_rename_no_C, 
  !(Ward == "Kabanga") & !(Ward == "Bukiriro")
)
question_3.df_remove_rows
question_3.df_remove_rows$Ward
