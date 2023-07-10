with
    fonte_aluguel as (
       select
            cast (rental_id as int) as id_aluguel
            , cast (inventory_id as int) as id_inventario
            , cast (staff_id as int) as id_funcionario
            , cast (customer_id as int) as id_cliente
            , cast (left(cast(rental_date as string), 10) as date) as data_aluguel
            , cast (left(cast(return_date as string), 10) as date) as data_devolucao_aluguel
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao
            , cast (left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'rental') }} 
    )
select *
from fonte_aluguel
