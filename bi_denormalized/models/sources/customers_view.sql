{{ config(materialized='view') }}

with source_customers as (

    select
        customer_id,
        city,
        province,
        street_address,
        zipcode,
        latitude,
        longitude,
        datetime_updated,
        datetime_created

    from {{ source('dbt', 'customers') }}
)

select *
from source_customers