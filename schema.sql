-- create a table for users
CREATE TABLE users (
 
    user_id         	SERIAL PRIMARY KEY,
    user_name          	VARCHAR,
    user_type         	VARCHAR CHECK (user_type IN ('Low','Med','High')),
    custom_pricing      VARCHAR(2) CHECK (custom_pricing IN ('Y','N'))

 );

-- checking table after dataload

SELECT *
FROM users
;

-- create a table for the sales transaction and customer details
CREATE TABLE sales_transaction (
 
    trans_dt_time       	TIMESTAMP,
    cc_num      	        NUMERIC,
    user_name               VARCHAR,
    category                VARCHAR,
    amount                  NUMERIC,
    first_name              VARCHAR,
    last_name               VARCHAR,
    gender                  VARCHAR,
    street                  VARCHAR,
    city                    VARCHAR,
    state                   VARCHAR,
    zip                     VARCHAR,
    lat                     NUMERIC,
    long                    NUMERIC,
    city_popn                NUMERIC,
    job                     VARCHAR,
    dob                     TIMESTAMP,
    trans_num               VARCHAR,
    unix_time               NUMERIC,
    merch_lat               NUMERIC,
    merch_long              NUMERIC,
    is_fraud                INT CHECK (is_fraud IN (0,1)),
    merch_zipcode           NUMERIC
 );

 --checking data after loading

SELECT reltuples::bigint AS estimated_count 
FROM pg_class 
WHERE relname = 'sales_transaction';


-- create a table for the pricing models
CREATE TABLE pricing_model (
 
    model_id         SERIAL PRIMARY KEY,
    user_id          INT,
    user_name        VARCHAR,
    user_type        VARCHAR CHECK (user_type IN ('Low','Med','High')),
    flat_fee         NUMERIC,
    base_fee         NUMERIC,
    percentage_fee   NUMERIC

 );

--checking data after loading
SELECT *
FROM pricing_model
;


-- create a table for the transaction fees table
CREATE TABLE fees (
 
    trans_num              VARCHAR,
    trans_dt_time          TIMESTAMP,
    user_id                INT,
    transaction_fees       NUMERIC

 );

--checking data after loading
SELECT *
FROM fees
LIMIT 3
;

SELECT reltuples::bigint AS estimated_count 
FROM pg_class 
WHERE relname = 'fees';

-- create a table for the monthly bill table
CREATE TABLE monthly_bill (
 
user_id				    INT,	
billing_month			TIMESTAMP,
total_transactions		INT,
total_transaction_fees	DECIMAL,
flat_fee				NUMERIC,
total_monthly_fee		DECIMAL	

 );

--checking data after loading
SELECT *
FROM monthly_bill
;


-- create an exception scenario where user id does not have a pricing model
DELETE FROM pricing_model
WHERE user_id = 11

