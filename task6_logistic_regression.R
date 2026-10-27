# Занятие 6. Логистическая регрессия

library(ggplot2)
library(ROCR)

# 1. Загрузка данных
df <- read.csv("Employee.csv", stringsAsFactors = TRUE)
str(df)

# 2. Точечная диаграмма
ggplot(df, aes(x = Age, y = PaymentTier, col = factor(LeaveOrNot), shape = Gender)) +
  geom_jitter(width = 0.3, height = 0.15, alpha = 0.5) +
  theme_minimal() +
  labs(title = "Увольнение в зависимости от возраста, зарплаты и пола", 
       x = "Возраст", y = "Грейд зарплаты", col = "LeaveOrNot")

# 3. Модель логистической регрессии
fit <- glm(LeaveOrNot ~ Gender + Age + PaymentTier, data = df, family = "binomial")
summary(fit)
exp(fit$coefficients)

# 4. Предсказанные вероятности
df$prob <- predict(fit, type = "response")
head(df[, c("Gender", "Age", "PaymentTier", "LeaveOrNot", "prob")])

# 5. ROC-кривая
pred_fit <- prediction(df$prob, df$LeaveOrNot)
perf_fit <- performance(pred_fit, "tpr", "fpr")
plot(perf_fit, colorize = TRUE, print.cutoffs.at = seq(0, 1, by = 0.1))

# 6. Специфичность и чувствительность
perf_spec <- performance(pred_fit, x.measure = "cutoff", measure = "spec")
perf_sens <- performance(pred_fit, x.measure = "cutoff", measure = "sens")
perf_acc  <- performance(pred_fit, x.measure = "cutoff", measure = "acc")

plot(perf_spec, col = "red", lwd = 2)
plot(perf_sens, col = "green", lwd = 2, add = TRUE)
plot(perf_acc,  col = "black", lwd = 2, add = TRUE)

# точка пересечения чувствительности и специфичности
cutoffs <- perf_spec@x.values[[1]]
spec_vals <- perf_spec@y.values[[1]]
sens_vals <- perf_sens@y.values[[1]]
cutoff <- cutoffs[which.min(abs(spec_vals - sens_vals))]
cutoff

# 7. Классификация по выбранному порогу
df$pred_resp <- ifelse(df$prob >= cutoff, 1, 0)

# 8. Сравнение с фактом и расчет точности
df$correct <- ifelse(df$pred_resp == df$LeaveOrNot, 1, 0)
table(Факт = df$LeaveOrNot, Прогноз = df$pred_resp)
accuracy <- sum(df$correct) / nrow(df)
accuracy
