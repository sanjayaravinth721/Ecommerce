-- -----------------------------------------------------
-- Schema full_stack_ecommerce
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS full_stack_ecommerce;

SET search_path TO full_stack_ecommerce;

--
-- Prep work
--
SET CONSTRAINTS ALL DEFERRED;

DROP TABLE IF EXISTS order_item CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS address CASCADE;

--
-- Table structure for table address
--
CREATE TABLE address (
  id SERIAL PRIMARY KEY,
  city VARCHAR(255),
  country VARCHAR(255),
  state VARCHAR(255),
  street VARCHAR(255),
  zip_code VARCHAR(255)
);

--
-- Table structure for table customer
--
CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255)
);

--
-- Table structure for table orders
--
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  order_tracking_number VARCHAR(255),
  total_price NUMERIC(19,2),
  total_quantity INT,
  billing_address_id BIGINT,
  customer_id BIGINT,
  shipping_address_id BIGINT,
  status VARCHAR(128),
  date_created TIMESTAMP(6),
  last_updated TIMESTAMP(6),
  UNIQUE (billing_address_id),
  UNIQUE (shipping_address_id),
  CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (id),
  CONSTRAINT fk_billing_address_id FOREIGN KEY (billing_address_id) REFERENCES address (id),
  CONSTRAINT fk_shipping_address_id FOREIGN KEY (shipping_address_id) REFERENCES address (id)
);

--
-- Table structure for table order_item
--
CREATE TABLE order_item (
  id SERIAL PRIMARY KEY,
  image_url VARCHAR(255),
  quantity INT,
  unit_price NUMERIC(19,2),
  order_id BIGINT,
  product_id BIGINT,
  CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders (id),
  CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES product (id)
);
