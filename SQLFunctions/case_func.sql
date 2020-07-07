-- CREATE NEW TABLE --
CREATE TABLE SALES_ORDER (
    ORDER_NO VARCHAR(10),
    CUSTOMER VARCHAR(50),
    AMOUNT DECIMAL(18,2)
);

-- LOAD SAMPLE DATA --
INSERT INTO SALES_ORDER
VALUES  ('1','John', 99.08),
        ('2','Jessica', 121.98),
        ('3','Emilia', 176.90),
        ('4','Ahmed', 16.99),
        ('5','Erik', 301.88)

-- VIEW SAMPLE DATA LOADED --
SELECT  ORDER_NO,
        CUSTOMER,
        AMOUNT
FROM    SALES_ORDER

-- DISCOUNT SCENARIO
-- IF AMOUNT < 100 THEN 5% DISCOUNT
-- IF AMOUNT < 200 THEN 10% DISCOUNT, AMOUNT >= 200 THEN 20% DISCOUNT

SELECT  ORDER_NO,
        CUSTOMER,
        AMOUNT,
        CASE    WHEN AMOUNT < 100 THEN AMOUNT * 5 / 100
                WHEN AMOUNT < 200 THEN AMOUNT * 10 / 100
        ELSE AMOUNT * 20 / 100 END AS DISCOUNT
FROM    SALES_ORDER