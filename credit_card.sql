--1 Write a query to print top 5 cities with highest spend and their percentage contribution of total credit card spends
WITH ctel AS(
SELECT city,SUM(amount) AS total_spend
FROM credit_card_transacation
GROUP BY city),
total_spent AS (SELECT SUM(CAST(amount AS bigint)) AS total_amount FROM credit_card_transacation)
SELECT TOP 5 ctel.*,ROUND((total_spend/total_amount)*100,2) AS percent_spend FROM ctel
JOIN total_spent ON 1=1
ORDER BY total_spend DESC;