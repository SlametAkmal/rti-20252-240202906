CREATE DATABASE ecommerce;

\connect ecommerce;

CREATE TABLE products (

    id SERIAL PRIMARY KEY,

    product_name VARCHAR(255),

    category VARCHAR(100),

    price NUMERIC(12,2),

    stock INTEGER

);