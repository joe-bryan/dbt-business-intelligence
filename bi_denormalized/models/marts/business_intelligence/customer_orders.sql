{{ config(materialized='view') }}

select
    fact_orders.order_id,
    fact_orders.customer_id,
    fact_orders.order_status,
    fact_orders.order_purchase_timestamp,
    fact_orders.order_approved_timestamp,
    fact_orders.order_delivered_carrier_timestamp,
    fact_orders.order_delivered_customer_timestamp,
    fact_orders.order_estimated_delivery_date,
    fact_orders.amount,
    fact_orders.order_segment,
    fact_orders.cost,
    fact_orders.profit,
    fact_orders.item_price,
    fact_orders.quantity,
    dimension_customers.street_address as customer_address,
    dimension_customers.city as customer_city,
    dimension_customers.state_code as customer_province_code,
    dimension_customers.zipcode as customer_zipcode,
    dimension_customers.latitude as customer_latitude,
    dimension_customers.longitude as customer_longitude
from {{ ref('fact_orders') }}
    join {{ ref('dimension_customers') }} on fact_orders.customer_id = dimension_customers.customer_id
    and fact_orders.order_purchase_timestamp >= dimension_customers.valid_from
    and fact_orders.order_purchase_timestamp <= dimension_customers.valid_to