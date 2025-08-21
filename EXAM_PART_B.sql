CREATE TABLE IF NOT EXISTS television_store(
id SERIAL PRIMARY KEY, 
catalog_number INT UNIQUE NOT NULL,
brand_name VARCHAR(20) NOT NULL,
model VARCHAR(50) NOT NULL,
screen_size INT NOT NULL CHECK (screen_size > 0),
resolution VARCHAR(20) NOT NULL,
price DECIMAL(7,2) NOT NULL CHECK (price > 0),
stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
release_year INT NOT NULL,
smart_tv VARCHAR(3) NOT NULL,
os VARCHAR(20) 
		CHECK((smart_tv = 'yes' AND os IS NOT NULL) 
		OR (smart_tv = 'no' AND os IS NULL)),
panel_type VARCHAR(20) NOT NULL 

);

-- id - 'primary key' was inserted for a future use of table with anothr tables if neccsery.

INSERT INTO television_store 
(id, catalog_number,brand_name,model,screen_size,resolution,price,stock_quantity,release_year,smart_tv,os,panel_type)
VALUES 
(1, 10001, 'LG', 'GXKS2', 55, '8K', 4250, 8, 2024, 'yes', 'LG_OS', 'OLED'),
(2, 10002, 'SAMSUNG', 'Q80T5', 65, '4K', 3200, 12, 2023, 'yes', 'SAMS_OS', 'QLED'),
(3, 10003, 'SONY', 'TDGH987JH', 50, 'Full_HD', 1800, 20, 2022, 'no', NULL, 'LED');


