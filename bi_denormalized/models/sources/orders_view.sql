{{ config(materialized='view') }}

with source_order as (

    select
        order_id,
        order_status,
        order_purchase_timestamp,
        order_approved_timestamp,
        order_delivered_carrier_timestamp,
        order_estimated_delivery_date,
        order_delivered_customer_timestamp,
        customer_id

    from {{ source('dbt', 'orders') }}
)

select *
from source_order