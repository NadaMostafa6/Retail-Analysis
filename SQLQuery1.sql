
--select count(*) from NTI_cleaned_data;

-- Q1.What are the top 10 products by revenue?
select top 10 StockCode,Description, sum(Quantity) as total_quantity,
sum(Quantity * Price ) as total_revenue
from NTI_cleaned_data 
group by StockCode , Description
order by total_revenue desc

select * from NTI_Project 
where StockCode='B'

-- Q.What are products that have less revenue?
select top 1000 StockCode,Description, sum(Quantity) as total_quantity,
sum(Quantity * Price ) as total_revenue
from NTI_cleaned_data 
group by StockCode , Description
order by total_revenue asc

-- Q2.How does monthly revenue trend over the two years? 
SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * Price) AS MonthlyRevenue
FROM NTI_Project
group by
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY Year, Month;

-- Q3.Which countries generate the most revenue, and how concentrated is it? 

select Country,sum(Quantity * Price) as total_revenue 
from NTI_Project group by Country
order by total_revenue desc;

--Q4. Which customers order most frequently, and what is their average order value? 
SELECT Customer_ID, COUNT(DISTINCT Invoice) AS NumberOfOrders,
avg(Quantity)
FROM NTI_Project GROUP BY Customer_ID 
having Customer_ID <>-1
ORDER BY NumberOfOrders DESC

/*
SELECT
    Customer_ID,
    COUNT(DISTINCT Invoice) AS NumberOfOrders,
    SUM(Quantity * Price) / COUNT(DISTINCT Invoice) AS AverageOrderValue
FROM NTI_Project
WHERE Customer_ID <> -1
GROUP BY Customer_ID
ORDER BY NumberOfOrders DESC;
*/

------------------------------------------------
SELECT
    SUM(Quantity * Price) AS TotalDiscount
FROM NTI_Project
WHERE StockCode = 'D';

SELECT
    SUM(Quantity * Price) AS Revenue
FROM NTI_Project;

SELECT
    (SELECT SUM(Quantity * Price)
     FROM NTI_Project
     WHERE StockCode <> 'D')
-
    (SELECT ABS(SUM(Quantity * Price))
     FROM NTI_Project
     WHERE StockCode = 'D') AS Revenue;

------------------------------------------------
