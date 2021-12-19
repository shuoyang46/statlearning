library(randomForest)
library(MASS)

require(tree)
require(ISLR2)
library(randomForest)

attach(Boston)
set.seed(1)

dim(Boston)

train=sample(1:nrow(Boston),nrow(Boston)/2) #50/50 split between test and train
boston.test=Boston[-train,"medv"]

summary(train)
summary(test)

bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=12, impoortance=TRUE)
bag.boston

yhat.bag=predict(bag.boston,newdata=Boston[-train,])
plot(yhat.bag,boston.test)
abline(0,1)

mean((yhat.bag-boston.test)^2)
