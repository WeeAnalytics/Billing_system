INSERT INTO monthly_bill (user_id,billing_month,total_transactions,total_transaction_fees,flat_fee,total_monthly_fee)


SELECT
    fees.user_id,			
    DATE_TRUNC('month',fees.trans_dt_time) AS billing_month,				
    COUNT(trans_num) AS total_transactions,			
    SUM(transaction_fees) AS total_transaction_fees,	
    flat_fee,	
    SUM(transaction_fees) + pricing_model.flat_fee  AS total_monthly_fee

FROM fees
JOIN pricing_model
ON fees.user_id = pricing_model.user_id

GROUP BY fees.user_id,billing_month,flat_fee
ORDER BY billing_month ASC



SELECT *
FROM monthly_bill
LIMIT 3