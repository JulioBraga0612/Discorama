with
    fonte_ator as (
       select
            cast(actor_id as int) as id_ator
            , cast(first_name as string) as ator_primeiro_nome
            , cast(last_name as string) as ator_ultimo_nome
            , first_name || ' ' || last_name as ator_nome_completo
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'actor') }} 
    )
select *
from fonte_ator