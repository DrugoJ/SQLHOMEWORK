SELECT * FROM Track t    ; 
--1. Изменить таблицу Артистов (вместо AC/DC сделать что-то другое, например DC/AC) 
UPDATE Artist 
SET Name="DC/AC" 
WHERE ArtistId=1;
--2. Изменить таблицу Артистов - удалить запись с исполнителем по имени BackBeat. Далее выполнить запрос , подтверждающий удаление
DELETE FROM Artist  
WHERE Name = "BackBeat";

SELECT * FROM Artist ;
--3. Подсчитать количество записей в таблице Invoices для которых BillingCity = Berlin , далее изменить в них город на Tartu. Потом сделать подсчет количества счетов из города Tartu.

SELECT COUNT(i.InvoiceId )
FROM Invoice i
WHERE i.BillingCity = "Berlin";

UPDATE Invoice 
SET BillingCity="Tartu"
WHERE BillingCity ="Berlin";

SELECT COUNT(i.InvoiceId )
FROM Invoice i
WHERE i.BillingCity = "Tartu";

--4.1 Создать новую запись в таблице Genres  c именем MyNewGenre. 
INSERT INTO Genre (name)
VALUES ("MyNewGenre");

--4.2 Создать новую запись в таблице Invoice 

INSERT INTO Invoice
(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total)
VALUES(555, 3, '2009-01-01 00:00:02', 'Theodor-Heuss-Straße 34ss', 'Tartu', 'AB', 'Estonia', '10000', 5.23);

--В следующих запросах предлагается использовать агрегацию данных  
--5. Выведи роль и количество сотрудников, кто работает в этой роли (табл. Employee) 
SELECT Title, COUNT(*) AS Title 
FROM Employee
GROUP BY Title;
--6. Выведи страну и среднюю сумму счета (табл. Invoice) 
SELECT i.BillingCountry, AVG(i.Total) AS AvgTotal 
FROM Invoice i 
GROUP BY BillingCountry; 
--В следующих запросах предлагается использовать вложенный запрос 
--7. Вывести все записи таблицы Tracks у которых жанр = Jazz.  
SELECT * FROM Track 
WHERE GenreId IN 
	(SELECT GenreId  
	FROM Genre g 
	WHERE g.Name ="Jazz") ;

--8. Вывести все записи таблицы Invoices у которых Customer из города London Использовать оператор JOIN 
SELECT Invoice.* FROM Invoice   
JOIN Customer  ON Invoice.CustomerId = Customer.CustomerId 
WHERE Customer.City ="London";

--9. Вывести поля CustomerId, Total из таблицы Invoices и поле City из таблицы Customers. 
SELECT Invoice.CustomerId, Invoice.Total, Customer.City  FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId 
GROUP BY Customer.CustomerId;

--10. Вывести все поля из таблицы Albums и поле Name из таблицы Artists. 
SELECT Album.*, Artist.Name  FROM Album 
JOIN Artist ON Album.ArtistId = Artist.ArtistId;

--11. Вывести поля TrackId, Name из таблицы Tracks и название жанра таблицы Genres.
SELECT Track.TrackId, Track.Name, Genre.Name FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId;

--12. Получить записи из таблицы Customers у которых имя клиента начинается на букву М 
SELECT * FROM Customer 
WHERE Customer.FirstName LIKE 'M%';

--13. Посчитать кол-во записей таблицы Customers у которых имя клиента кончается на букву А 
SELECT COUNT(*) FROM Customer
WHERE Customer.FirstName LIKE '%A';


