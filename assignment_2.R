mat = matrix(1:6, nrow = 2)
mat

mat_t = t(mat)
mat_t

friends = c(
    "Jordan", "Joshua", "Tito", "Tia",
    "Bryan", "Loreal", "Wimba", "Lexis"
)
friends

length(friends)

head(friends, 2L)

friends[2]
friends[3]

sort(friends, decreasing = FALSE)
sort(friends, decreasing = TRUE)
order(friends)


# question 2
df = data.frame(
    gender = c("M", "F", "F", "M", "T", "T"),
    age = c(10, 22, 11, 5, 21, 19)
)
df$weight = c(65, 77, 89, 90, 56, 34)
df

df = subset(df, select = -c(gender))
df

if (!require(readxl)) { install.packages("readxl") }
library(readxl)

df2 = readxl::read_excel("surver_dataset.xlsx")
df2
head(df2)
View(df2)

df3 = subset(df2, month == 3 | month == 8 | month == 11)
print(df3)

df_september = subset(df2, month == 9)
print(df_september)

df_merged = merge(df3, df_september, all = TRUE)
head(df_merged)

df_merged_sorted = df_merged[order(df_merged$record_id),]
head(df_merged_sorted)

df2

correlation = cor(subset(df2, select = c(hindfoot_length, weight)))
correlation

chisq.test(subset(df2, select = c(hindfoot_length, weight)))

Vec1_Age<- c(34,40,30,23,21,24,44,60,90,94)  

Vec2_Height<- 
c(1.7,1.65,1.2,1.69,1.51,1.36,2.37,2.08,1.5,1.6) 

?matrix
q3_mat = matrix(c(Vec1_Age, Vec2_Height), ncol = 2)
q3_mat

sum(Vec1_Age)
mean(Vec1_Age)
prod(Vec1_Age)

sum(Vec2_Height)
mean(Vec2_Height)
prod(Vec2_Height)

q3_df = data.frame(
    age = Vec1_Age,
    height = Vec2_Height
)
q3_df

if (!require(ggplot)) { install.packages("ggplot") }
library(ggplot2)

c1 = ggplot(q3_df) +
    aes(x = age, y = height) +
    geom_line() +
    xlab("X") + 
    ylab("Y") +
    ggtitle("Age vs Height") 

ggsave("c1.png", c1)

c2 = ggplot(q3_df) +
        aes(y = height) +
        geom_boxplot() +
        ylab("Height") +
        ggtitle("Height")
ggsave("c2.png", c2)

c3 = ggplot(q3_df) +
        aes(x = age) +
        geom_histogram(binwidth = 5) +
        xlab("Age") +
        ggtitle("Age")
c3
ggsave("c3.png", c3)
