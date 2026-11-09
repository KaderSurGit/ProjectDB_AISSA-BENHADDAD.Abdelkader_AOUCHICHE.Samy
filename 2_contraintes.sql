-- 2_contraintes.sql

-- A master cannot start mentoring someone before they are hired
ALTER TABLE ARTISAN
ADD CONSTRAINT chk_mentorship_date CHECK (Mentorship_Start_Date >= Hire_Date);

-- A bespoke order cannot be delivered before it is created
ALTER TABLE BESPOKE_ORDER
ADD CONSTRAINT chk_order_dates CHECK (Estimated_Date >= Order_Date);

-- Ensure prices and quantities are strictly positive
ALTER TABLE LIMITED_PRODUCT
ADD CONSTRAINT chk_positive_price CHECK (Catalog_Price > 0);

ALTER TABLE LIMITED_PRODUCT
ADD CONSTRAINT chk_positive_limit CHECK (Production_Limit > 0);

ALTER TABLE STOCK
ADD CONSTRAINT chk_positive_stock CHECK (Stock_Quantity >= 0);

ALTER TABLE PURCHASE
ADD CONSTRAINT chk_positive_purchase CHECK (Purchase_Quantity > 0);

ALTER TABLE BESPOKE_ORDER
ADD CONSTRAINT chk_positive_bespoke_price CHECK (Final_Price >= 0);