# Занятие 3. Описательные статистики и графики

library(psych)
library(ggplot2)

# Загружаем датасет с маркой BMW
df <- read.csv("bmw.csv", stringsAsFactors = TRUE)
str(df)

# 1. Описательные статистики для цены
mean(df$price)
median(df$price)
sd(df$price)
range(df$price)

# 2. Средняя стоимость по типу топлива
aggregate(price ~ fuelType, data = df, FUN = mean)

# 3. Средняя стоимость по типу топлива и коробке передач
aggregate(price ~ fuelType + transmission, data = df, FUN = mean)

# 4. Описательная статистика через psych::describe
describe(df)
describe(df[, c("price", "mpg")])

# 5. Стандартные графики R
# гистограмма цены
hist(df$price, breaks = 20, col = "lightblue", main = "Гистограмма стоимости BMW", xlab = "Цена ($)", ylab = "Частота")

# ящик с усами
boxplot(price ~ transmission, data = df, main = "Стоимость по типу коробки передач", xlab = "Коробка передач", ylab = "Цена ($)")

# точечная диаграмма
plot(df$mileage, df$price, pch = 16, col = rgb(0, 0, 1, 0.2), main = "Цена от пробега", xlab = "Пробег", ylab = "Цена")

# 6. Гистограмма через ggplot2 для расхода (mpg)
ggplot(df, aes(x = mpg)) +
  geom_histogram(binwidth = 3, fill = "steelblue", color = "white") +
  theme_minimal() +
  labs(title = "Гистограмма расхода топлива", x = "Расход (миль на галлон)", y = "Количество")

# 7. График плотности стоимости по типу топлива
ggplot(subset(df, fuelType %in% c("Diesel", "Petrol", "Hybrid")), aes(x = price, fill = fuelType)) +
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Плотность распределения стоимости по топливу", x = "Цена", y = "Плотность")

# 8. Точечная диаграмма: цена от пробега, цвет - топливо, размер - объем двигателя
ggplot(subset(df, fuelType %in% c("Diesel", "Petrol", "Hybrid")), 
       aes(x = mileage, y = price, color = fuelType, size = engineSize)) +
  geom_point(alpha = 0.4) +
  theme_minimal() +
  labs(title = "Зависимость стоимости от пробега и объема двигателя", x = "Пробег", y = "Цена")
