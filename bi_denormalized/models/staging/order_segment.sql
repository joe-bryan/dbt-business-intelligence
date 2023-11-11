{{ config(materialized='view') }}

with source_prices as (

    select
        amount_id,
        order_id,
        CASE
            WHEN amount >= 1000 THEN 'star'
            WHEN amount >= 500 THEN 'preferred'
            WHEN amount >=100 THEN 'mailer'
            ELSE 'standard'
        END as order_segment


    from {{ ref('staging_prices') }}
)

select *
from source_prices