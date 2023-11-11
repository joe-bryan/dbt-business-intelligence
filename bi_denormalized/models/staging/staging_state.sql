{{ config(materialized='view') }}

with source as (
    
    select *
    from {{ source('dbt', 'state') }}

), 

cte as (

    select
        state_id::INT,
        state_name,
        state_code::VARCHAR(2)

    from source
)

select *
from cte