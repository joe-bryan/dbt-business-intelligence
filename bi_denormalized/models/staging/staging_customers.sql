{{ config(materialized='view') }}

with source as (
    
    select *
    from {{ ref('customers_snapshot') }}

), 

cte as (

    select
        customer_id,
        city,
        province,
        street_address,
        zipcode,
        latitude,
        longitude,
        datetime_updated::TIMESTAMP AS datetime_updated,
        datetime_created::TIMESTAMP AS datetime_created,
        dbt_valid_from,
        dbt_valid_to

    from source
)

select *
from cte