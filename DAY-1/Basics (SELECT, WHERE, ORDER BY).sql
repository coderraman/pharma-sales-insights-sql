
CREATE TABLE "Pharma" (
    order_id      VARCHAR(20),
    order_date    VARCHAR(20),
    Salesname      VARCHAR(50),
    region        VARCHAR(30),
    city          VARCHAR(50),
    customer_Type       VARCHAR(30),
    product       VARCHAR(100),
    Category          VARCHAR(30),
    quantity      INT,
    unit_price    NUMERIC(10,2),
    total_amount  NUMERIC(12,2)
);

ALTER TABLE "Pharma"
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'DD-MM-YYYY');

Select * from "Pharma";

-- Day 1: Basics (SELECT, WHERE, ORDER BY)

-- Query.	Pehli 10 rows dikhao.

-- Code
Select * from "Pharma"
order by order_id Limit 10;

-- Insight : Query se Pharma Sale Table ki Top 10 Rows Product from 200 rows Vsual hota hain.

-- Query.	Sirf order_id, salesname, product, total_amount columns dikhao.

-- Code
Select order_id, salesname, product, total_amount from "Pharma";

-- Insight : Query se Pharma Sale ke Columns order_id, salesname, product, and total_amount of data Visual hota hain.

-- Query.	Distinct region, category aur customer_type ki list nikalo.

-- Code
SELECT DISTINCT region FROM "Pharma";
SELECT DISTINCT category FROM "Pharma";
SELECT DISTINCT customer_type FROM "Pharma";

-- Insight: Query se Pharma dataset ke unique Region × Category × Customer_Type combinations milte hain. 

-- Query.	West region ke saare orders dikhao.

-- Code
Select * from "Pharma"
Where region = 'West';

-- Insight: Query se Pharma West Region ke sare orders visual hote hain Total West Region Orders 41.

-- Query.	Wo orders nikalo jinka total_amount 10,000 se zyada hai, bade se chhote order mein.

-- Code
Select * from "Pharma"
Where total_amount > 10000
order by total_amount DESC;

-- Insight: Query se Pharma Sales > 10k visual hoti hain, Total orders 34 and Top sale amount 55238.

-- Query.	Sirf "Injection" category ke orders nikalo jinki quantity 50 se zyada hai.

-- Code
Select * from "Pharma"
Where category = 'Injection' AND quantity > 50;

-- Insight:  Query se Pharma Sale category'Injection' AND quantity > 50 Visual hoti hain, Total orders 9.

-- Query.	Jan 2026 ke orders dikhao (BETWEEN use karo).

-- Code
Select * from "Pharma"
WHERE order_date Between '2026-01-01' AND '2026-01-31';

-- Insight: Query se Pharma Sale ke one month ka orders data show hota hain, Order count 19 only in First Jan Month.
