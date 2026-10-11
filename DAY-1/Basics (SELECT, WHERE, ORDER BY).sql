
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

-- 1.	Pehli 10 rows dikhao.
Select * from "Pharma"
order by order_id Limit 10;

-- 2.	Sirf order_id, salesname, product, total_amount columns dikhao.
Select order_id, salesname, product, total_amount from "Pharma";

-- 3.	Distinct region, category aur customer_type ki list nikalo.
SELECT DISTINCT region FROM "Pharma";
SELECT DISTINCT category FROM "Pharma";
SELECT DISTINCT customer_type FROM "Pharma";

-- 4.	West region ke saare orders dikhao.
Select * from "Pharma"
Where region = 'West';

-- 5.	Wo orders nikalo jinka total_amount 10,000 se zyada hai, bade se chhote order mein.
Select * from "Pharma"
Where total_amount > 10000
order by total_amount DESC;

-- 6.	Sirf "Injection" category ke orders nikalo jinki quantity 50 se zyada hai.
Select * from "Pharma"
Where category = 'Injection' AND quantity > 50;

-- 7.	Jan 2026 ke orders dikhao (BETWEEN use karo).
Select * from "Pharma"
WHERE order_date Between '2026-01-01' AND '2026-01-31';