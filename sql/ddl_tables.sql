CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    region VARCHAR(100)
);
