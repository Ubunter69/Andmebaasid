SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...) 
-----------------
CREATE TABLE - создать таблицу
table_name - имя новой таблицы
(column_name1 datatype, ...) - имя столбца и тип данных

INSERT INTO table_name(column_name1, ...) 
VALUES (column_value1, ...) вставить значения 
-----------------
INSERT INTO - вставить в
table_name - название таблицы
(column_name1 datatype, ...) - названия столбцов и тип данных
VALUES (column_value1, ...) - значения для вставки

DROP TABLE table_name -
-----------------
DROP TABLE - удалить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition 
-----------------
UPDATE - обновить
table_name -  название таблицы
SET - установить
column_name1=column_value1 - имя столбцо и его новое значение
WHERE - где(условие)
condition - заключение

ALTER TABLE table_name ADD column_name datatype -
-----------------
ALTER TABLE - изменить таблицу
table_name - название таблицы
ADD - добавить
column_name2 datatype - имя нового столбца и тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменить таблицу
table_name - tabeli nimi
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - название вторичного ключа
References - ссылается на
table_name2 - название второй таблицы
(column_name2) - имя первичного ключа
