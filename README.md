# Вспомогательные команды
открыть доступ ко всему
```
sudo chmod -R 777 .
```
пересборка докера
```
docker-compose up -d --build --force-recreate
```


# Текст задания

Задание по БД
Создайте базу данных для компьютерной игры, рассчитанную на использование в высоконагруженной среде с большим количеством пользователей. База должна быть максимально быстрой для игроков и максимально подробной для аналитиков.
Обязательные требования:
1. Авторизация игрока;
1. Уровень и достижения игрока;
1. Актуальный рейтинг игрока;
1. У одного игрока может быть несколько персонажей;
1. У каждого персонажа есть набор базовых характеристик и есть набор характеристик, меняющихся по мере прокачки;
1. Информация о участниках, времени и результатах матчей;
1. Логирование событий в игре: убийства, смерти.
Желательные требования:
1. Шифрование пароля игрока на стороне БД;
1. Архивирование в отдельную таблицу игроков, давно не заходивших в игру*;
1. Архивирование в отдельную таблицу результатов матчей*.
* При архивировании данных использовать хранимые процедуры, а для архивных таблиц желательно настроить партиционирование.

Хранимые процедуры-отчёты для БД:
1. Выбрать по 3 часто используемых персонажа у трёх игроков с наивысшим рейтингом;
1. Выбрать персонажа с наивысшим соотношением убийства/смерти за последний год по месяцам в разрезе уровней игроков;
1. Вывести дату, длительность и результаты 10 последних матчей игрока(input parameter).
По желанию можно усложнить структуру БД, добавив дополнительные поля и таблицы, полезные для функционирования игры.

Решение должно содержать:
1. Структуру БД (таблицы и индексы);
1. Тестовые данные;
1. Хранимые процедуры архивирования и отчётов.

Результат будет оценен в баллах исходя из следующих максимумов:
1. Реализация обязательных требований: 10б;
1. Типы данных: 10б;
1. Нормализация БД: 10б;
1. Индексы: 5б;
1. Шифрование: 5б;
1. Процедуры архивирования: 10б;
1. Партиционирование: 10б;
1. Отчёт 1: 5б;
1. Отчёт 2: 15б;
1. Отчёт 3: 10б;
1. Усложнение структуры БД: 10б.

Вопросы и дамп/бэкап базы с решением присылать в телеграмм Антону Крелю @krelant .
