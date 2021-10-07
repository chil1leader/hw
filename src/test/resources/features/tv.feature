# language: ru
# encoding: utf-8
Функция: Телевизоры

  Я как посетитель сайта ДНС хочу просматривать раздел с телевизорами.
  Это позволит мне выбрать понравившийся телевизор и просмотреть его характеристики.

  Предыстория:
    Дано Открыта Главная страница ДНС
    И Выполнен переход на страницу Телевизоры

  @default
  Сценарий: Фильтрация, сортировка телевизоров и проверка соответсвия фильтров найденным товарам на странице Телевизоры
    И Установлена сортировка "Сначала дорогие"
    И В фильтре "Производитель" выбрано значение "Samsung"
    И В фильтре "Диагональ экрана" выбрано значение "40-60"
    И В фильтре "Частота обновления" выбрано значение "120"
    И В фильтре "Тип подсветки" выбрано значение "Direct LED"
    Когда Применены выбранные фильтры
    И Выполнен переход на страницу первого товара из списка
    Тогда Проверить: В заголовке страницы отображается текст "Samsung"
    Когда Открыты характеристики
    Тогда Проверка характеристик

  @structure
  Структура сценария: Фильтрация и сортировка смартфонов на странице Смартфоны
    Дано Установлена сортировка <sortBy>
    И В фильтре <filterBy1> выбрано значение <value1>
    И В фильтре <filterBy2> выбрано значение <value2>
    И В фильтре <filterBy3> выбрано значение <value3>
    И В фильтре <filterBy4> выбрано значение <value4>
    Когда Применены выбранные фильтры
    И Выполнен переход на страницу первого товара из списка
    Тогда Проверить: В заголовке страницы отображается текст <value1>
    Когда Открыты характеристики
    Тогда Проверка характеристик
    Примеры:
      | sortBy               | filterBy1       | value1    | filterBy2          | value2    | filterBy3            | value3    | filterBy4          | value4       |
      | "Сначала дорогие"    | "Производитель" | "Samsung" | "Диагональ экрана" | "40-60"   | "Частота обновления" | "120"     | "Тип подсветки"    | "Direct LED" |
      | "Сначала популярные" | "Производитель" | "Samsung" | "Диагональ экрана" | "30-40"   | "Частота обновления" | "60"      | "Тип подсветки"    | "Edge LED"   |
      | "Сначала популярные" | "Производитель" | "LG"      | "Диагональ экрана" | "60-75"   | "Частота обновления" | "120"     | "Тип подсветки"    | "OLED"       |
      | "По наименованию"    | "Производитель" | "Xiaomi"  | "Диагональ экрана" | "30-50"   | "Частота обновления" | "60"      | "Тип подсветки"    | "Direct LED" |

  @table1
  Сценарий: Таблица с одной колонкой
    Дано Установлена сортировка "Сначала дорогие"
    И Установлены фильтры из таблицы с одной колонкой
      | Samsung    |
      | 40-60      |
      | 120        |
      | Direct LED |
    Когда Применены выбранные фильтры
    И Выполнен переход на страницу первого товара из списка
    Тогда Проверить: В заголовке страницы отображается текст "Samsung"
    Когда Открыты характеристики
    Тогда Проверка характеристик

  @table2
  Сценарий: Таблица с двумя колонками
    Дано Установлена сортировка "Сначала дорогие"
    И Установлены фильтры из таблицы с двумя колонками
      | Company                   | Samsung    |
      | Screen Size               | 40-60      |
      | Refresh Rate              | 120        |
      | Backlight                 | Direct LED |
    Когда Применены выбранные фильтры
    И Выполнен переход на страницу первого товара из списка
    Тогда Проверить: В заголовке страницы отображается текст "Samsung"
    Когда Открыты характеристики
    Тогда Проверка характеристик


  @table3
  Сценарий: Таблица с тремя колонками
    Дано Установлена сортировка и фильтры из таблицы с тремя колонками
      | Sort            | Company       | Screen Size   | Refresh Rate | Backlight  |
      | Сначала дорогие | Samsung       | 40-60         | 120          | Direct LED |
    Когда Применены выбранные фильтры
    И Выполнен переход на страницу первого товара из списка
    Тогда Проверить: В заголовке страницы отображается текст "Samsung"
    Когда Открыты характеристики
    Тогда Проверка характеристик
