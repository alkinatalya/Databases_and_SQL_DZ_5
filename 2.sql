DROP DATABASE IF EXISTS hw5;
CREATE DATABASE hw5;
USE hw5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT * FROM cars;

# Задание 1 Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW info AS
SELECT*
FROM cars
WHERE cost < 25000;
SELECT * FROM info;

# Задание 2 Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
# (используя оператор ALTER VIEW) 
ALTER VIEW info AS
SELECT*
FROM cars
WHERE cost < 30000;
SELECT * FROM info;

# Задание 3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” 
CREATE VIEW info2 AS
SELECT *
FROM cars
WHERE  name = "Skoda" OR name = "Audi";
SELECT * FROM info2;

# Доп задания:
# Задание 1

SELECT
DENSE_RANK() OVER(ORDER BY cost) AS 'danse_rank',
name, cost
FROM cars;


# Задание 2
# Вариант 1
SELECT
name,
cost,
SUM(cost) OVER(ORDER BY cost ROWS BETWEEN 
CURRENT ROW  AND 3 FOLLOWING ) AS 'sum'
FROM cars
LIMIT 5, 3;

#Вариант 2
SELECT
name,
cost,
SUM(cost) OVER(ORDER BY cost DESC) AS 'sum'
FROM cars
LIMIT 3;

# Задание 3
SELECT
 id, name, cost,
 LAG(cost) OVER (ORDER BY cost DESC) AS `lag`
 FROM cars;  
 
# Задание 4
SELECT id, name, cost,
LEAD(`cost`) OVER (ORDER BY cost) AS `lead`
FROM cars;
# Задание 5
/*SELECT id, name, cost,
FIRST_VALUE(`cost`) OVER (ORDER BY cost) AS `first_value`,
LAST_VALUE(`cost`) OVER (ORDER BY cost) AS `last_value`
FROM cars;





