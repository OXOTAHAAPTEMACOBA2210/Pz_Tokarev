# Занятие 1. Основы работы с R

# 1. Поголовье животных
cattle <- 3456
pig_population <- 7333
chicken_population <- 23459

meat_cows <- 1320
milk_cows <- cattle - meat_cows
milk_cows

egg_chickens <- 12457
meat_chickens <- chicken_population - egg_chickens
meat_chickens

# 2. Перевозка свиней
total_pigs <- 1457
capacity <- 14

trucks <- total_pigs %/% capacity
trucks

remaining_pigs <- total_pigs %% capacity
remaining_pigs

# 3. Тестовые коровы и надой
milk_per_day <- c(12, 4, 7, 18, 10)
annual_milk <- milk_per_day * 365
annual_milk

mean_annual <- mean(annual_milk)
mean_annual
# средний надой 3723 литра, это меньше 5000-7000 л, коровы не высокопродуктивные

# 4. Датафрейм с коровами
cows_names <- c("Ералаш", "Пальто", "Кощей", "Адидас", "Зима")
cows_df <- data.frame(
  Name = cows_names,
  Daily_Yield = milk_per_day,
  Annual_Yield = annual_milk
)
cows_df
