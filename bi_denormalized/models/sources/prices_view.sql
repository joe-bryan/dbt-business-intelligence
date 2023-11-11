{{ config(materialized='view') }}

with source_prices as (

    select
        amount_id,
        amount,
        cost,
        profit,
        item_price,
        quantity,
        order_id

    from {{ source('dbt', 'prices') }}
)

select *
from source_prices