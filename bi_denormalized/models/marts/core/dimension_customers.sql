with customers as (
    select *
    from {{ ref('staging_customers') }}
),

state as (
    select *
    from {{ ref('staging_state') }}
)

select 
    customers.customer_id,
    customers.city,
    state.state_code,
    customers.street_address,
    customers.zipcode,
    customers.latitude,
    customers.longitude,
    customers.province,
    state.state_name,
    customers.datetime_created,
    customers.datetime_updated,
    customers.dbt_valid_from::TIMESTAMP as valid_from,
    CASE
        WHEN customers.dbt_valid_to IS NULL THEN '9999-12-31'::TIMESTAMP
        ELSE customers.dbt_valid_to::TIMESTAMP
    END as valid_to
from customers
    join state on customers.province = state.state_name