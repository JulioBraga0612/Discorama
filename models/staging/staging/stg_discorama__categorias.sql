with
    fonte_categoria as (
       select
            cast(category_id as int) as id_categoria
            , cast(name as string) as categoria_nome
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'category') }} 
    )
select *
from fonte_categoria
,"name","last_update"