-- Найти самый дорогой товар. Вывести имя товара и его цену
SELECT Goods.name, Prices.value FROM Goods
JOIN Prices ON Prices.goods_id = Goods.id
WHERE Prices.value = (SELECT MAX(Prices.value) FROM Prices);

-- Найти товары с нулевым остатком. Вывести имя товара и его цену
SELECT Goods.name, Prices.value AS price FROM Goods
LEFT JOIN Prices ON Goods.id = Prices.goods_id
LEFT JOIN Quantity ON Quantity.goods_id = Goods.id
WHERE Quantity.value = 0 OR Quantity.value IS NULL;

-- Найти производителя с самой большой средней ценой за товары. Вывести имя производителя и среднюю стоимость
SELECT Manufacturer.name, ROUND(AVG(Prices.value), 2) AS average_price FROM Prices
JOIN Goods ON Goods.id = Prices.goods_id
JOIN Suppliers ON Suppliers.id = Goods.supplier_id
JOIN Manufacturer ON Manufacturer.id = Suppliers.manufacturer_id
GROUP BY Manufacturer.name
ORDER BY AVG(Prices.value)
DESC
LIMIT 1;

-- Найти все товары производителей из Москвы. Вывести имена товаров, их цены и имена производителей
SELECT Goods.name, Prices.value AS price, Manufacturer.name AS manufacturer FROM Prices
JOIN Goods ON Goods.id = Prices.goods_id
JOIN Suppliers ON Suppliers.id = Goods.supplier_id
JOIN Manufacturer ON Manufacturer.id = Suppliers.manufacturer_id
WHERE Manufacturer.location = 'Moscow';
