{% snapshot customers_snapshot %}

{{
    config(
      target_database='dbt',
      target_schema='snapshots',
      strategy='timestamp',
      unique_key='customer_id',
      updated_at='datetime_updated',
    )
}}

select * from {{ source('dbt', 'customers') }}

{% endsnapshot %}