library(MASS)
#install.packages("stargazer")
library(stargazer)

# Model A
data <- read.csv("host_focus_data.csv")
head(data)
data$host_gender = factor(data$host_gender)
data$host_age = factor(data$host_age)
summary(data)
stargazer(data)
model_a <- lm(data$sentiment ~ data$true_score + data$host_gender + data$host_age, 
                data = data)
summary(model_a)
stargazer(model_a)

# Model B logistic regression
model_b <- glm(data$sentiment ~ data$true_score + data$host_gender + data$host_age, 
               family=binomial(link='logit'), data = data)
summary(model_b)
stargazer(model_b)


# Model C
data <- read.csv("reviewer_focus_data.csv")
head(data)
summary(data)
stargazer(data)
data$reviewer_gender = factor(data$reviewer_gender)
data$reviewer_age = factor(data$reviewer_age)
model_c <- lm(data$sentiment ~ data$true_score + data$reviewer_gender + data$reviewer_age, 
              data = data)
summary(model_c)
stargazer(model_c)
# Model D logistic regression
model_d <- glm(data$sentiment ~ data$true_score + data$reviewer_gender + data$reviewer_age, 
               family=binomial(link='logit'), data = data)
summary(model_d)
stargazer(model_d)

