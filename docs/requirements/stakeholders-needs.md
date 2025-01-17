# Запити зацікавлених осіб

## Зміст

1. [Вступ](#article1)  
   1.1 [Мета](#article11)  
   1.2 [Контекст](#article12)  
   1.3 [Основні визначення та скорочення](#article13)
2. [Характеристика ділових процесів](#article2)
3. [Короткий огляд продукту](#article3)
4. [Функціональність](#article4)
5. [Практичність](#article5)
6. [Надійність](#article6)
7. [Продуктивність](#article7)
8. [Експлуатаційна придатність](#article8)

## <a name="article1">1. Вступ</a>

В цьому документі описана інформація щодо зацікавлення потреб зацікавлених осіб (аналітиків, менеджерів, викладачів).

### <a name="article11">1.1 Мета</a>

Метою цієї сукупності вимог є розроблення зручного сервісу для організування клієнтом опитування та обробки результатів опитування.

### <a name="article12">1.2 Контекст</a>

Цей документ формує технічне завдання для системи організації та управління опитуваннями експертів "FoxPoll"

### <a name="article13">1.3 Основні визначення та скорочення</a>

Див. ["Основні визначення"](https://github.com/JenyaFTW/foxpoll/blob/master/docs/requirements/state-of-the-art.md#article2)

## Короткий зміст

## <a name="article2">2. Характеристика ділових процесів</a>

### <a name="article21">2.1 Призначення сервісу для опитувань</a>

Функціонал сервісу призначений для створення повного циклу онлайн-опитувань експертів і тестів для різних сфер. Результатом роботи сервісу є отримання замовником зібраних даних.

### <a name="article22">2.2 Взаємодія з замовником</a>

Замовники можуть зв’язатися з персональним менеджером сервісу, що обслуговує користувачів через систему технічної підтримки для отримання необхідної допомоги у вирішенні виниклих питань. Створення бланків відповідей на типові запитання для поліпшення взаємодії з користувачем.

### <a name="article23">2.3 Сценарії використання</a>

#### Сценарій №1

**_ID:_** BUC-001

**_НАЗВА:_** Запит на створення нового опитування

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Замовник увійшов до системи опитуваннь.

**_РЕЗУЛЬТАТ:_** Запит схвалено, повернено макет на заповнення опитування.

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-01-01: Замовник скасував запит на створення нового опитування, система не отримала запит.
- EX-01-02: Система відхилила запит на створення нового опитування.

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник надсилає запит на створення нового опитування.
2. Система отримує запит на створення. (Можливо EX-01-01)
3. Система аналізує запит.
4. Система повертає макет на створення опитування замовнику. (Можливо EX-01-02)

#### Сценарій №2

**_ID:_** BUC-002

**_НАЗВА:_** Створення опитування

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Макет для створення опитування

**_РЕЗУЛЬТАТ:_** Опитування створено успішно

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-02: Макет не було створено

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник заповнює макет згідно своїх потреб. (Можливо EX-02)
2. Замовник надсилає запит на збреження опитування до системи.
3. Система отримує запит на створення опитування.
4. Система зберегла опитування.

#### Сценарій №3

**_ID:_** BUC-003

**_НАЗВА:_** Редагування опитування

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Існує опитування

**_РЕЗУЛЬТАТ:_** Опитування відредаговано

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-03: Замовник не зберіг зміни опитування.

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник редагує опитування.
2. Замовник надсилає запит до системи на збереження відредагованого опитування.
3. Система отримує запит на збереження редагування опитування. (Можливо EX-03)
4. Система зберігає зміни до опитування.

#### Сценарій №4

**_ID:_** BUC-004

**_НАЗВА:_** Видалення опитування

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Існує опитування

**_РЕЗУЛЬТАТ:_** Опитування видалено

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-04: Замовник скасував запит на видалення опитування.

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник надсилає запит до системи на видалення опитування. (Можливо EX-04)
2. Система отримує запит на видалення.
3. Система видаляє опитування.

#### Сценарій №5

**_ID:_** BUC-005

**_НАЗВА:_** Огляд статистики опитування

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Існує опитування

**_РЕЗУЛЬТАТ:_** Отримання статистики

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-05: Замовник скасував запит на отримання статистики опитування.

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник надсилає запит до системи на отримання статистики опитування. (Можливо EX-05)
2. Система отримує запит на повернення статистики опитування.
3. Система оброблює результати та надсилає замовнику.

#### Сценарій №6

**_ID:_** BUC-006

**_НАЗВА:_** Отримання результату проходження опитування

**_УЧАСНИКИ:_** Експерт, система опитування

**_ПЕРЕДУМОВИ:_** Експерт завершив опитування

**_РЕЗУЛЬТАТ:_** Система зберегла результат проходження опитування

**_ВИКЛЮЧНІ СИТУАЦІЇ:_** Немає

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Експерт надсилає пройдене опитування до системи.
2. Система отримує результат проходження опитування.
3. Система зберігає результати.

#### Сценарій №7

**_ID:_** BUC-007

**_НАЗВА:_** Завершення опитування замовником

**_УЧАСНИКИ:_** Замовник, система опитування

**_ПЕРЕДУМОВИ:_** Замовник обрав опитування

**_РЕЗУЛЬТАТ:_** Опитування завершено

**_ВИКЛЮЧНІ СИТУАЦІЇ:_**

- EX-07: Замовник скасував запит на завершення опитування.

**_ОСНОВНИЙ СЦЕНАРІЙ:_**

1. Замовник надсилає запит до системи на завершення опитування. (Можливо EX-07)
2. Система отримує та оброблює запит на завершення опитування.

## <a name="article3">3. Короткий огляд продукту</a>

**FoxPoll** (від англ. _Fox_ - лисиця, _Poll_ - опитування) - це система організації та управління опитуваннями експертів, що полегшує взаємодію між зацікавленими особами та експертами. У ролі експертів можуть виступати люди різного віку та діяльності, залежно від змісту опитування. Опитування проводиться у взаємодії з web-інтерфейсом.

## <a name="article4">4. Функціональність</a>

Перед особами, що зацікавлені у предметі розробки, постають вимоги до функціональності.Існує три категорії таких осіб:

- Користувач:
  - Експерт
  - Аналітик
  - Замовник

**4.1 Можливості «Користувач»:**

- Зареєструватися у системі;
- Авторизуватися у системі.

**4.1.1 Можливості «Експерт»:**

- Проходити саме опитування.
- Управляти списком опитування.

**4.1.2 Можливості «Замовник»:**

- Замовляти опитування.
- Перегляд звітності опитування.

**4.1.3 Можливості «Аналітик»:**

- Керування процесом підготовки та проведення самого опитування:
  - Створення опитування;
  - Додавання питань до опитування;
  - Надсилання запрошення для участі в опитуванні;
  - Аналіз результатів опитування;
  - Управління експертним середовищем;
  - Формування звітності для замовника.

## <a name='article5'>5. Практичність</a>

Основні вимоги практичності, надані клієнтами - це створення зручного і зрозумілого інтерфейсу, для приємної роботи з предметом опитування, а також для створення опитувань і роботи з їхніми результатами.

## <a name='article6'>6. Надійність</a>

Основними вимогами для надійності, наданими клієнтами до предмету розробки- це регулярне створення резервних копій баз даних і результатів опитувань.

## <a name='article7'>7. Продуктивність</a>

Основні вимоги продуктивності, надані клієнтами - це стабільна робота сервера для опитувань націлена на одночасну роботу з великою кількістю експертів.

## <a name='article8'>8. Експлуатаційна придатність</a>

Основні вимоги експлуатаційного терміну роботи, надані клієнтами - це постійна підтримка системи, її регулярні оновлення та покращення протягом усього терміну роботи системи зазначеного в договорі.
