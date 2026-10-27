# Занятие 5. Множественная линейная регрессия

df <- read.csv("bmw.csv", stringsAsFactors = TRUE)

# 1. Множественная регрессия от года и пробега
fit1 <- lm(price ~ year + mileage, data = df)
fit1
summary(fit1)

# 2. Модель со всеми факторами
fit_all <- lm(price ~ ., data = df)
summary(fit_all)

# Исключаем налог и расход для проверки через ANOVA
fit_reduced <- lm(price ~ model + year + transmission + mileage + fuelType + engineSize, data = df)
anova(fit_all, fit_reduced)

# 3. Пошаговое исключение факторов
opt_model <- step(fit_all, direction = "backward")
summary(opt_model)
