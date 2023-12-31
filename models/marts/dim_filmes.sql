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
            stg_filmes.id_filme
            , stg_categorias.id_categoria
            , stg_filmes.titulo_do_filme
            , stg_filmes.descricao_do_filme
            , stg_filmes.prazo_para_entrega_locacao
            , stg_filmes.preco_da_locacao
            , stg_filmes.duracao_do_filme
            , stg_filmes.preco_ressarcimento
            , stg_filmes.classificacao_indicativa
            , stg_categorias.categoria_nome
        from  stg_filmes
        left join stg_categoria_filme on stg_categoria_filme.id_filme = stg_filmes.id_filme
        left join stg_categorias on stg_categorias.id_categoria = stg_categoria_filme.id_categoria
    )
   
   select *
   from joined