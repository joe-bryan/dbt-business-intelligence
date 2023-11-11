select
    staging_orders.order_id,
    staging_orders.customer_id,
    staging_orders.order_status,
    staging_orders.order_purchase_timestamp,
    staging_orders.order_approved_timestamp,
    staging_orders.order_delivered_carrier_timestamp,
    staging_orders.order_estimated_delivery_date,
    staging_orders.order_delivered_customer_timestamp,
    staging_prices.amount,
    order_segment.order_segment,
    staging_prices.cost,
    staging_prices.profit,
    staging_prices.item_price,
    staging_prices.quantity
from {{ ref('staging_orders') }}
    join {{ ref('staging_prices') }} on staging_orders.order_id = staging_prices.order_id
    join {{ ref('order_segment') }} on order_segment.order_id = staging_prices.order_id
    