CREATE SCHEMA IF NOT EXISTS data_warehouse;
CREATE SCHEMA IF NOT EXISTS snapshots;
DROP TABLE IF EXISTS data_warehouse.customers;
CREATE TABLE data_warehouse.customers (
    customer_id INT,
    city VARCHAR(100),
    province VARCHAR(100),
    street_address VARCHAR(100),
    zipcode VARCHAR(10),
    latitude VARCHAR(100),
    longitude VARCHAR(100),
    datetime_updated VARCHAR(100),
    datetime_created VARCHAR(100)
);
DROP TABLE IF EXISTS data_warehouse.orders;
CREATE TABLE data_warehouse.orders (
    order_id VARCHAR(40),
    order_status VARCHAR(25),
    order_purchase_timestamp VARCHAR(100),
    order_approved_timestamp VARCHAR(100),
    order_delivered_carrier_timestamp VARCHAR(100),
    order_estimated_delivery_date VARCHAR(100),
    order_delivered_customer_timestamp VARCHAR(100),
    customer_id INT
);
DROP TABLE IF EXISTS data_warehouse.state;
CREATE TABLE data_warehouse.state (
    state_id VARCHAR(10),
    state_name VARCHAR(50),
    state_code VARCHAR(50)
);
DROP TABLE IF EXISTS data_warehouse.prices;
CREATE TABLE data_warehouse.prices (
    amount_id INT,
    amount NUMERIC(9,2),
    cost NUMERIC(9,2),
    profit NUMERIC(9,2),
    item_price NUMERIC(9,2),
    quantity INT,
    order_id VARCHAR(40)
);
COPY data_warehouse.customers(customer_id,
    city,
    province,
    street_address,
    zipcode,
    latitude,
    longitude,
    datetime_updated,
    datetime_created
)
FROM '/sourcedata/customer.csv' DELIMITER ',' CSV HEADER;
COPY data_warehouse.state(state_id,
    state_name,
    state_code
)
FROM '/sourcedata/state.csv' DELIMITER ',' CSV HEADER;
COPY data_warehouse.orders(
    order_id,
    order_status,
    order_purchase_timestamp,
    order_approved_timestamp,
    order_delivered_carrier_timestamp,
    order_estimated_delivery_date,
    order_delivered_customer_timestamp,
    customer_id
)
FROM '/sourcedata/orders.csv' DELIMITER ',' CSV HEADER;
COPY data_warehouse.prices(
    amount_id,
    amount,
    cost,
    profit,
    item_price,
    quantity,
    order_id
)
FROM '/sourcedata/prices.csv' DELIMITER ',' CSV HEADER;