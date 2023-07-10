with 
    stg_discorama__atores as (
        select *
        from {{ source('fivetran_discorama', 'actor') }} 
    )

 
    , transformed as (
        select 
            id_ator
            , ator_primeiro_nome
            , ator_ultimo_nome
            , ator_nome_completo
            , ultima_atualizacao
            , el_fivetran
        from stg_discorama__atores
    )

select *
from transformed