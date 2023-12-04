{{ config(schema='staging') }}
select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('jaffle_shop', 'orders') }}
    

{% if env_var('DBT_ENVIRONMENT') == 'dev' %}
where order_date >= dateadd('day', -3, current_date)
{% endif %}
