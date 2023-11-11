{{ config(materialized='view') }}

with source as (
    
    select *
    from {{ source('dbt', 'orders') }}

), 

cte as (

    select
        order_id,
        order_status,
        order_purchase_timestamp::TIMESTAMP,
        order_approved_timestamp::TIMESTAMP,
        order_delivered_carrier_timestamp::TIMESTAMP,
        order_estimated_delivery_date::TIMESTAMP,
        order_delivered_customer_timestamp::TIMESTAMP,
        customer_id

    from source
)

select *
from cte