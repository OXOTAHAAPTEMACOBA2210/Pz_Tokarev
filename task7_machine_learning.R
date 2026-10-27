# Занятие 7. Методы машинного обучения

library(caTools)
library(party)
library(randomForest)
library(e1071)

# 1. Загрузка данных iris и разбивка 70/30
df <- iris

set.seed(42)
sample <- sample.split(df$Species, SplitRatio = 0.7)
train <- subset(df, sample == TRUE)
test  <- subset(df, sample == FALSE)

# 2.1 Дерево решений
model <- ctree(Species ~ ., train)
plot(model)

predict_model <- predict(model, test)
m_at <- table(test$Species, predict_model)
m_at
ac_Test <- sum(diag(m_at)) / sum(m_at)
ac_Test

# 2.2 Случайный лес
classifier_RF <- randomForest(x = train[-5], y = train$Species, ntree = 500)
classifier_RF
plot(classifier_RF)

importance(classifier_RF)

y_pred <- predict(classifier_RF, newdata = test[-5])
confusion_mtx <- table(test[, 5], y_pred)
confusion_mtx
ac_Test2 <- sum(diag(confusion_mtx)) / sum(confusion_mtx)
ac_Test2

# 2.3 Метод опорных векторов (SVM)
classifier <- svm(formula = Species ~ ., data = train, type = "C-classification", kernel = "linear")
classifier

y_pred3 <- predict(classifier, newdata = test[-5])
cm <- table(test[, 5], y_pred3)
cm
ac_Test3 <- sum(diag(cm)) / sum(cm)
ac_Test3

# 3. Итоговая таблица точности
results <- data.frame(
  Model = c("Дерево решений", "Случайный лес", "SVM"),
  Accuracy = c(ac_Test, ac_Test2, ac_Test3)
)
results

# 4. Наиболее точный метод
results[which.max(results$Accuracy), ]
