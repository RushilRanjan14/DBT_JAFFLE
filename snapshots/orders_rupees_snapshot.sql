-- snapshots/orders_rupees_snapshot.sql

{% snapshot orders_rupees_snapshot %}
    {{
        config(
            target_schema='snapshots',
            unique_key='order_id',
            strategy='check',
            check_cols=['*']
        )
    }}


    select * from {{ ref('orders_rupees') }}

{% endsnapshot %}
