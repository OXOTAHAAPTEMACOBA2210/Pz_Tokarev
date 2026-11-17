# Шпаргалка: Необходимые файлы и пакеты для каждого ПЗ

Краткое руководство по запуску практических работ в RStudio / Posit Cloud / онлайн-компиляторах.

---

## 📌 Сводная таблица

| Занятие | Скрипт | Необходимый файл данных (.csv) | Нужные библиотеки (пакеты) |
|---|---|---|---|
| **ПЗ 1** | `task1_basics.R` | *Не требуется* (данные в коде) | *Базовый R* |
| **ПЗ 2** | `task2_dataframes.R` | `Employee.csv` | *Базовый R* |
| **ПЗ 3** | `task3_descriptive_stats.R` | `bmw.csv` | `psych`, `ggplot2` |
| **ПЗ 4** | `task4_correlation_regression.R` | `bmw.csv` | `psych`, `ggplot2` |
| **ПЗ 5** | `task5_multiple_regression.R` | `bmw.csv` | *Базовый R* (`lm`, `anova`, `step`) |
| **ПЗ 6** | `task6_logistic_regression.R` | `Employee.csv` | `ggplot2`, `ROCR` |
| **ПЗ 7** | `task7_machine_learning.R` | *Не требуется* (встроенный `iris`) | `caTools`, `party`, `randomForest`, `e1071` |

---

## 🚀 Команда для установки всех пакетов разом

Если запускаете проект в новой среде (например, чистый Posit Cloud), выполните одну строку в консоли R:

```r
install.packages(c("ggplot2", "psych", "ROCR", "caTools", "party", "randomForest", "e1071"))
```

---

## 📂 Главный итог
Для работы всех 7 заданий с диска требуется всего **2 CSV-файла**:
1. **`bmw.csv`** — используется в ПЗ 3, 4, 5.
2. **`Employee.csv`** — используется в ПЗ 2, 6.
*(Для ПЗ 1 данные заданы внутри скрипта, а для ПЗ 7 используется встроенный в R датасет `iris`).*
