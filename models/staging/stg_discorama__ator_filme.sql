with
    fonte_ator_filme as (
       select
            cast(actor_id as int) as id_ator
            , cast(film_id as int) as id_filme
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'film_actor') }} 
    )
select *
from fonte_ator_filme