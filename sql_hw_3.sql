DROP DATABASE IF EXISTS hw_3;
CREATE DATABASE IF NOT EXISTS hw_3;

USE hw_3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45), 
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

/*
Задание 1
Отсортируйте данные по полю зароботная плата (salary) в порядке: убывания, возрастания.
*/

SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC;

/*
Задание 2
Выведите 5 маскимальных зароботных плат (salary)
*/

SELECT lastname, salary
FROM staff LIMIT 5;

/*
Задание 3
Посчитайте суммарную зарплату по каждой специальности
*/

SELECT post AS 'Специальность', SUM(salary) AS 'Суммарная зарплата по специальности'
FROM staff
GROUP BY post;

/*
Задание 4
Найдите кол-во сотрудников с специальностью "рабочий" в возрасте от 24 до 49 лет включительно
*/

SELECT post, COUNT(*) AS 'Количество сотрудников'
FROM staff
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49
GROUP BY post;

/*
Задание 5
Найдите количество специальностей
*/

SELECT COUNT(DISTINCT post) AS 'Количество специальностей'
FROM staff;

/*
Задание 6
Выведите специальности, у которых средний возраст всех сотрудников меньше 30 лет
*/

SELECT post, AVG(age) AS 'AVG'
FROM staff
GROUP BY post
HAVING AVG <= 30;