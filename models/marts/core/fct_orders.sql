
with orders as (

    select * from {{ ref('stg_orders') }}

),
order_status as (
    select * from {{ ref('order_status') }}
)
select orders.*, order_status.successful_order from orders

left join order_status using (status)

