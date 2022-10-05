
with source as (

    select * from {{ source('jaffle_shop_ext', 'products') }}

),

products as (

    select
        id,
        cogs,
        price,
        product_name,
        is_active,
        created_at,
        updated_at

    from source

)

select * from products
