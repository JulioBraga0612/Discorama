with
    dim_inventario as (
        select *
        from {{ ref('stg_discorama__inventario') }}
    )

    , dim_filmes as (
        select *
        from {{ ref('stg_discorama__filmes') }}
    )

    , dim_clientes as (
        select *
        from {{ ref('stg_discorama__clientes') }}
    )

    , dim_funcionarios as (
        select *
        from {{ ref('stg_discorama__funcionarios') }}
    )

    , int_alugueis as (
        select *
        from {{ ref('int_alugueis') }}
    )

    , joined as (
        select
        from int_alugueis
        left join dim_funcionarios on dim_funcionarios.id_funcionario = dim_funcionarios.id_funcionario
        left join dim_clientes on dim_clientes.id_cliente = dim_clientes.id_cliente
        left join dim_inventario on id_inventario = dim_inventario.id_inventario
        left join dim_filmes on dim_inventario.id_filme = dim_filmes.id_filme
    )

select *
from joined
