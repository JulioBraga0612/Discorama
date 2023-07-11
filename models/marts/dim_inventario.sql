with 
    stg_inventario as (
        select
            id_inventario
            , id_filme
            , id_loja
            , count(*) over(partition by id_filme, id_loja) as qtd_estoque_filme_por_loja
        from {{ ref('stg_discorama__inventario') }}
    )

select *
from stg_inventario
