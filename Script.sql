--1. Вывести на экран все столбцы таблицы Инвойс у которых город London и Total < 6
SELECT * FROM Invoice i
WHERE i.BillingCity = "London" AND i.Total < 6;
--2. Вывести на экран все столбцы таблицы Инвойс у которых город London или Oslo
SELECT * FROM Invoice i 
WHERE i.BillingCity = "London" OR i.BillingCity = "Oslo";
--3. Отсортировать таблицу Инвойс по имени города в убывающем порядке
SELECT * FROM Invoice i
ORDER BY i.BillingCity DESC;
--4. Вывести на экран записи таблицы Customers у которых заполнено поле Company
SELECT * FROM Customer c 
WHERE c.Company IS NOT NULL;
--5. Вывести на экран записи таблицы Customers у которых не заполнено поле State
SELECT * FROM Customer c 
WHERE c.State  IS NULL;
--6. Вывести все записи таблицы Customers, где State равен MA или NY или WA (применить IN)
SELECT * FROM Customer c 
WHERE c.State IN ("MA","NY","WA");
--7. Вывести на экран все записи таблицы Customers у которых State не равен СA
SELECT * FROM Customer c 
WHERE c.State != "CA";
--8. Вывести на экран количество записей таблицы Customers у которых State не равен СA
SELECT COUNT(*) FROM Customer c 
WHERE c.State != "CA"; 
--9. Вывести на экран количество записей таблицы Employees у которых заполнено ReportsTo
SELECT COUNT(*) FROM Employee e
WHERE e.ReportsTo IS NOT NULL;
--10. Вывести на экран количество записей таблицы Tracks у которых композитор AC/DC
SELECT COUNT(*) FROM Track t
WHERE t.Composer = "AC/DC";
--11. Отсортировать таблицу Tracks по имени исполнителя по возрастающей
SELECT * FROM Track t 
ORDER BY t.Composer ASC;
--12. Вычислить максимальную длительность композиции - таблица Tracks поле Milliseconds
SELECT MAX(t.Milliseconds) FROM Track t; 
--13. Вычислить средний (оператор AVG) размер песни - таблица Tracks поле Bytes
SELECT AVG(t.Bytes) FROM Track t;
--14. Вычислить сумму (оператор SUM)всех UnitPrice - таблица Tracks
SELECT SUM (t.UnitPrice) FROM Track t;

