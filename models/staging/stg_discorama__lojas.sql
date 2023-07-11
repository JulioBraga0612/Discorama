with
    fonte_loja as (
       select
            cast(store_id as int) as id_loja
            , cast(manager_staff_id as int) as id_gerente
            , cast(address_id as int) as id_endereco_loja
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(_fivetran_synced as timestamp) as el_fivetran
        from {{ source('fivetran_discorama', 'store') }} 
    )

select *
from fonte_loja