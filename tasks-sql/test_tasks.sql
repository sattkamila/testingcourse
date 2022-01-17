-- Найти самый дорогой товар. Вывести имя товара и его цену
SELECT g.name, p.value AS price FROM Prices p
JOIN Goods g ON p.goods_id = g.id
ORDER BY p.value
DESC
LIMIT 1;

-- Найти товары с нулевым остатком. Вывести имя товара и его цену
SELECT g.name, p.value AS price FROM Prices p
JOIN Goods g ON p.goods_id = g.id
JOIN Quantity q ON q.goods_id = g.id
WHERE q.value = 0;

-- Найти производителя с самой большой средней ценой за товары. Вывести имя производителя и среднюю стоимость
SELECT m.name, ROUND(AVG(p.value), 2) AS average_price FROM Prices p
JOIN Goods g ON p.goods_id = g.id
JOIN Suppliers s ON s.id = g.supplier_id
JOIN Manufacturer m ON m.id = s.manufacturer_id
GROUP BY m.name
ORDER BY AVG(p.value)
DESC
LIMIT 1;

-- Найти все товары производителей из Москвы. Вывести имена товаров, их цены и имена производителей
SELECT g.name, p.value AS price, m.name AS manufacturer FROM Prices p
JOIN Goods g ON p.goods_id = g.id
JOIN Suppliers s ON s.id = g.supplier_id
JOIN Manufacturer m ON m.id = s.manufacturer_id
WHERE m.location = 'Moscow';