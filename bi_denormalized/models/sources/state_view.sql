{{ config(materialized='view') }}

with source_state as (

    select
        state_id,
        state_name,
        state_code

    from {{ source('dbt', 'state') }}
)

select *
from source_state