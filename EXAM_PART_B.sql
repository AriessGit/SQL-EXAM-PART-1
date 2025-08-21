CREATE TABLE IF NOT EXISTS brand (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS resolution (
    resolution_id SERIAL PRIMARY KEY,
    resolution_name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS panel_type (
    panel_id SERIAL PRIMARY KEY,
    panel_name VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS television (
    tv_id SERIAL PRIMARY KEY,
    catalog_number VARCHAR(50) NOT NULL,
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    model VARCHAR(50) NOT NULL,
    screen_size INT NOT NULL CHECK (screen_size > 18),
    -- Screen must be bigger than 18 inches because it's the minimum size that I will sell in my store!
    resolution_id INT,
    FOREIGN KEY (resolution_id) REFERENCES resolution(resolution_id),
    price DECIMAL(7,2) NOT NULL CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    release_year INT NOT NULL,
    smart_tv VARCHAR(3) NOT NULL,
    os VARCHAR(30) 
        CHECK((smart_tv = 'yes' AND os IS NOT NULL)
       	 OR (smart_tv = 'no' AND os IS NULL)),
    panel_id INT,
    FOREIGN KEY (panel_id) REFERENCES panel_type(panel_id)
   	
    );

INSERT INTO brand (brand_name) VALUES
('Samsung'),
('LG'),
('Sony');

INSERT INTO resolution (resolution_name) VALUES
('4K'),
('8K'),
('FULL HD');

INSERT INTO panel_type (panel_name) VALUES
('OLED'),
('QLED'), 
('LED');

INSERT INTO television (tv_id, catalog_number, brand_id, model, screen_size, resolution_id, price, stock_quantity, release_year, smart_tv, os, panel_id)
VALUES
(1, '101A', 1, 'X45d', 55, 2, 2500, 20, 2023, 'yes', 'SAMI-1', 2),
(2, '101B', 2, 'x23f', 60, 1, 4700, 5, 2025, 'yes', 'SOME_OP_SYS', 1),
(3, '101C', 3, 'v87d', 22, 3, 700, 1, 2008, 'no', NULL, 3);
