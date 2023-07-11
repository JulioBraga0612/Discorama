with
    dim_inventario as (
        select *
        from {{ ref('dim_inventario') }}
    )

    , dim_filmes as (
        select *
        from {{ ref('dim_filmes') }}
    )

    , dim_clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , dim_funcionarios as (
        select *
        from {{ ref('dim_funcionarios') }}
    )

    , int_alugueis as (
        select *
        from {{ ref('int_alugueis') }}
    )

    , joined as (
        select
            dim_funcionarios.id_funcionario
            , dim_funcionarios.funcionario_nome_completo
            , dim_clientes.id_cliente
            , dim_clientes.id_loja
            , dim_clientes.cliente_nome_completo
            , dim_clientes.cliente_ativo
            , dim_clientes.endereco
            , dim_clientes.bairro
            , dim_clientes.cidade
            , dim_clientes.pais
            , dim_clientes.codigo_postal
            , dim_clientes.criado_atualizacao
            , dim_inventario.id_inventario
            , dim_filmes.id_filme
            , dim_filmes.id_categoria
            , dim_filmes.titulo_do_filme
            , dim_filmes.descricao_do_filme
            , dim_filmes.duracao_do_aluguel
            , dim_filmes.avaliacao_do_aluguel
            , dim_filmes.tamanho_do_aluguel
            , dim_filmes.preco_substituicao
            , dim_filmes.avaliacao
            , dim_filmes.categoria_nome
            , int_alugueis.id_aluguel
            , int_alugueis.id_pagamento
            , int_alugueis.valor_aluguel
            , int_alugueis.data_pagamento
            , int_alugueis.data_aluguel
            , int_alugueis.data_devolucao
        from int_alugueis
        left join dim_funcionarios 
            on int_alugueis.id_funcionario = dim_funcionarios.id_funcionario
        left join dim_clientes
            on int_alugueis.id_cliente = dim_clientes.id_cliente
        left join dim_inventario
            on int_alugueis.id_inventario = dim_inventario.id_inventario
        left join dim_filmes
            on dim_inventario.id_filme = dim_filmes.id_filme
    )
select *
from joined