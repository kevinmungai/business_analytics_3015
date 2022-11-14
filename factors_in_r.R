# creating a factor, first element is a vector passed to factor function
gender = c("female", "male", "female", "female")
gender.factor = factor(gender)


# structure of a factor
str(gender.factor)

# creating a factor with levels
gender.levels = c("female", "male", "transgender")
gender.factor_levels = factor(c(gender, "transgender", "other"), levels=gender.levels)

# structure of factor with 2 levels
str(gender.factor_levels)

# factors with order
education = c("high_school", "undergraduate", "masters", "phd")
education.levels = c("high_school", "undergraduate", "masters", "phd")
education.labels = c("HIGH_SCHOOL", "UNDERGRAD", "MASTERS", "PHD")
education.factor = factor(education, levels=education.levels,labels=education.labels, ordered = TRUE)

education.factor
# structure of factor with supplied levels, labels
str(education.factor)
