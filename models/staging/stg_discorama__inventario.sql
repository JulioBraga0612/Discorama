with
    fonte_inventario as (
       select
            cast(inventory_id as int) as id_inventario
            , cast(film_id as int) as id_filme
            , cast(store_id as int) as id_loja
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'inventory') }} 
    )
select *
from fonte_inventario