with 
    stg_filmes as (
        select *
        from {{ref('stg_discorama__filmes')}}
    )
    
    , stg_categoria_filme as (
        select *
        from {{ref('stg_discorama__categoria_filme')}}
    )
    
    , stg_categorias as (
        select *
        from {{ref('stg_discorama__categorias')}}
    )

    , joined as (
        select
        from 
    )
    