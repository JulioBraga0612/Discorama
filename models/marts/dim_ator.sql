with 
    stg_atores as (
        select *
        from {{ ref('stg_discorama__atores') }}
    )

    , transformed as (
        select            
            id_ator
            , ator_primeiro_nome
            , ator_ultimo_nome
            , ator_nome_completo
            , ultima_atualizacao
            , el_fivetran
        from stg_atores
    )

select *
from transformed