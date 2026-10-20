-- Day 2: Filtering (AND/OR, IN, LIKE, NULL)

Select * from "Pharma";

-- Query.	Mumbai ya Chennai ke orders nikalo (IN use karo).

-- Code
Select * from "Pharma"
WHERE City IN ('Mumbai');

-- Insights: Query se Pharma Sale Table ke Mumbai City ke orders Visual hote hain, Total Orders 21 from 200 rows data.

-- Query.	Wo products nikalo jinka naam "Amox" se start hota hai (LIKE).

-- Code
Select * from "Pharma"
WHERE product LIKE 'Amox%';

-- Insight: Query se Pharma Sale Table ke wo products visual hote hain jo Product "Amox" word se suru hota hain,
-- Total 29 orders hain jisme "Amox" word aata hain.

-- Query.	Hospital ya Clinic customers ke orders jinka total_amount 5,000 se upar ho.

-- Code
	Select * from "Pharma"
	WHERE customer_type IN ('Hospital','Clinic') AND total_amount > 5000;

-- Insight: Query se Pharma Sale Table ke wo orders visual hote hain jaha cutomer type
-- ('Hospital','Clinic') AND total_amount > 5000 hain, Total orders Count 37.
	
-- Query.	Check karo kisi column mein NULL hai ya nahi (IS NULL).	

-- Code
Select * from "Pharma"
WHERE ORDER_ID IS NULL 
or ORDER_DATE IS NULL
or  SALESNAME IS NULL
or  REGION IS NULL
or  CITY IS NULL
or  CUSTOMER_TYPE IS NULL
or  PRODUCT IS NULL
or  CATEGORY IS NULL
or  QUANTITY IS NULL
or  UNIT_PRICE IS NULL
or  TOTAL_AMOUNT IS NULL;

-- Insight: Query se Pharma Sale ka wo data visual hoga jaha NULL ayega.

-- 5.	Check karo quantity * unit_price aur total_amount match karte hain ya nahi
--      (data quality check, portfolio mein achha lagta hai).
Select * from "Pharma"
	Select order_id, Quantity, unit_price, total_amount,
	Round(quantity * unit_price,2) AS Calculated_amount,
	Round(total_amount - (quantity * unit_price),2) As Difference
	FROM "Pharma"
	where quantity * unit_price <> total_amount;