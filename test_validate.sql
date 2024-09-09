-- randomly select 3 users that have pricing model = low
SELECT *
FROM pricing_model
WHERE user_type = 'Low'
ORDER BY RANDOM()
LIMIT 3;

-- find random transactions from the 3 users 
WITH random_low_trans AS 
(
(SELECT *
FROM sales_transaction
WHERE user_name = 'Collier Inc'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Kris-Weimann'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Rippin, Kub and Mann'
ORDER BY RANDOM()
LIMIT 1)
)

-- manually calculate their transaction fee and compare it to the fee in the fee table
SELECT t.user_name,
       p.user_id,
       t.trans_num,
       t.amount,
       ROUND(base_fee + (amount*percentage_fee/100),2) AS calculated_fee,
       f.transaction_fees,
       p.*

FROM random_low_trans t
LEFT JOIN pricing_model p
ON t.user_name = p.user_name
LEFT JOIN fees f
ON t.trans_num = f.trans_num
;

-- randomly select 3 users that have pricing model = Med
SELECT *
FROM pricing_model
WHERE user_type = 'Med'
ORDER BY RANDOM()
LIMIT 3;

-- find random transactions from the 3 users 
WITH random_med_trans AS 
(
(SELECT *
FROM sales_transaction
WHERE user_name = 'Connell-Ullrich'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Pagac LLC'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Gaylord-Powlowski'
ORDER BY RANDOM()
LIMIT 1)
)

-- manually calculate their transaction fee and compare it to the fee in the fee table
SELECT t.user_name,
       p.user_id,
       t.trans_num,
       t.amount,
       ROUND(base_fee + (amount*percentage_fee/100),2) AS calculated_fee,
       f.transaction_fees,
       p.*

FROM random_med_trans t
LEFT JOIN pricing_model p
ON t.user_name = p.user_name
LEFT JOIN fees f
ON t.trans_num = f.trans_num
;



-- randomly select 3 users that have pricing model = High
SELECT *
FROM pricing_model
WHERE user_type = 'High'
ORDER BY RANDOM()
LIMIT 3;

-- find random transactions from the 3 users 
WITH random_high_trans AS 
(
(SELECT *
FROM sales_transaction
WHERE user_name = 'Kuhn LLC'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Schumm PLC'
ORDER BY RANDOM()
LIMIT 1)

UNION ALL

(SELECT *
FROM sales_transaction
WHERE user_name = 'Cormier LLC'
ORDER BY RANDOM()
LIMIT 1)
)

-- manually calculate their transaction fee and compare it to the fee in the fee table
SELECT t.user_name,
       p.user_id,
       t.trans_num,
       t.amount,
       ROUND(base_fee + (amount*percentage_fee/100),2) AS calculated_fee,
       f.transaction_fees,
       p.*

FROM random_high_trans t
LEFT JOIN pricing_model p
ON t.user_name = p.user_name
LEFT JOIN fees f
ON t.trans_num = f.trans_num
;

