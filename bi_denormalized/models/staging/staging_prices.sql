{{ config(materialized='view') }}

with source as (
    
    select *
    from {{ source('dbt', 'prices') }}

), 

cte as (

    select
        amount_id,
        amount,
        cost,
        profit,
        item_price,
        quantity,
        order_id

    from source
)

select *
from cte