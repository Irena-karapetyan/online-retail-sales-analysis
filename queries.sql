-- 1. Топ-10 самых продаваемых товаров
SELECT Description, SUM(Quantity) AS total_quantity
FROM online_retail_cleaned
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

-- 2. Страны с наибольшей выручкой
SELECT Country, ROUND(SUM(TotalPrice), 2) AS total_revenue
FROM online_retail_cleaned
GROUP BY Country
ORDER BY total_revenue DESC;


-- 3. Средний чек по клиентам
SELECT CustomerID, ROUND(SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo), 2) AS avg_order_value
FROM online_retail_cleaned
GROUP BY CustomerID
ORDER BY avg_order_value DESC;


-- 4. Выручка по часам (пиковые часы продаж)
SELECT EXTRACT(HOUR FROM InvoiceDate) AS hour_of_day,
       ROUND(SUM(TotalPrice), 2) AS revenue
FROM online_retail_cleaned
GROUP BY hour_of_day
ORDER BY hour_of_day;

