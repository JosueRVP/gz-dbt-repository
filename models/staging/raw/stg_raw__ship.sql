with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,-- Nos quedamos solo con una después de la comprobación
        logcost,
        -- Casteamos ship_cost a FLOAT64 (decimal) que es el apropiado para dinero
        CAST(ship_cost AS FLOAT64) as ship_cost

    from source

)

select * from renamed