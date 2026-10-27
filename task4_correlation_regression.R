# Занятие 4. Корреляция и линейная регрессия

library(psych)
library(ggplot2)

df <- read.csv("bmw.csv", stringsAsFactors = TRUE)

# 1. Корреляция цены и пробега
cor.test(df$mileage, df$price)

# 2-3. Датасет только с численными переменными и парные диаграммы
df_numeric <- df[, c("year", "price", "mileage", "tax", "mpg", "engineSize")]
pairs(df_numeric)

# 4. Матрица корреляций и проверка значимости
cor(df_numeric)
fit_corr <- corr.test(df_numeric)
fit_corr$r
fit_corr$p

# 5. Парная линейная регрессия цены от пробега
fit <- lm(price ~ mileage, data = df)
fit
summary(fit)

# 6. Точечная диаграмма с линией тренда
ggplot(df, aes(x = mileage, y = price)) +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "lm", col = "red") +
  theme_minimal() +
  labs(title = "Линейная регрессия стоимости от пробега", x = "Пробег", y = "Цена")

# 7. Добавление факторов (коробка передач и тип топлива)
ggplot(df, aes(x = mileage, y = price, col = transmission)) +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Регрессия по типу КПП", x = "Пробег", y = "Цена")

ggplot(subset(df, fuelType %in% c("Diesel", "Petrol", "Hybrid")), aes(x = mileage, y = price, col = fuelType)) +
  geom_point(alpha = 0.25) +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Регрессия по типу топлива", x = "Пробег", y = "Цена")

# 8. Прогноз по модели
new_mileage <- data.frame(mileage = c(1564, 32587, 9834, 343445, 10045))
predict(fit, new_mileage)
