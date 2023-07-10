with
    fonte_categoria_filme as (
       select
            cast(film_id as int) as id_filme
            , cast(category_id as int) as id_categoria
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'film_category') }} 
    )
select *
from fonte_categoria_filme