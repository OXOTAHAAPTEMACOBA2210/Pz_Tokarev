# Занятие 2. Работа с Дата фреймами (Employee.csv)

# 1. Загрузка данных и структура
df <- read.csv("Employee.csv", stringsAsFactors = FALSE)
nrow(df)
ncol(df)
str(df)

# уникальные значения качественных признаков
unique(df$Education)
unique(df$City)
unique(df$Gender)
unique(df$EverBenched)

# 2. summary для данных
summary(df)

# 3. Сотрудники старше и младше среднего возраста
mean_age <- mean(df$Age)
mean_age
older <- df[df$Age > mean_age, ]
younger <- df[df$Age < mean_age, ]
head(older)
head(younger)

# 4. Присоединились до 2016 года (пол, возраст, стаж)
early_emp <- df[df$JoiningYear < 2016, c("Gender", "Age", "ExperienceInCurrentDomain")]
head(early_emp)

# 5. Средний уровень оплаты и возраст уволившихся
mean(df$PaymentTier[df$LeaveOrNot == 1])
mean(df$Age[df$LeaveOrNot == 1])

# 6. Мин и макс стаж для PaymentTier == 3
min(df$ExperienceInCurrentDomain[df$PaymentTier == 3])
max(df$ExperienceInCurrentDomain[df$PaymentTier == 3])
range(df$ExperienceInCurrentDomain[df$PaymentTier == 3])

# 7. Увольнения среди мужчин и женщин
table(df$Gender, df$LeaveOrNot)
prop.table(table(df$Gender, df$LeaveOrNot), 1)

# 8. Различия в уровне оплаты
table(df$Gender, df$PaymentTier)

# 9. Город регистрации большинства
table(df$City)

# 10. Средний возраст тех, кто раньше всех пришел в компанию
min_year <- min(df$JoiningYear)
mean(df$Age[df$JoiningYear == min_year])

# 11. Уровень образования
table(df$Education)

# 12. Образование и пол
table(df$Education, df$Gender)

# 13. Кто чаще увольнялся
table(df$Education, df$LeaveOrNot)
prop.table(table(df$Education, df$LeaveOrNot), 1)

# 14. Разделение датасета по LeaveOrNot
df_stayed <- subset(df, LeaveOrNot == 0)
df_left <- subset(df, LeaveOrNot == 1)
nrow(df_stayed)
nrow(df_left)
