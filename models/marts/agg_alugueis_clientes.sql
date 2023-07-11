with
    fact_alugueis as (
        select *
        from {{ ref('fact_alugueis') }}
    )

    , group_by_data_aluguel as (
        select
            id_funcionario
            , funcionario_nome_completo
            , id_cliente
            , cliente_nome_completo
            , data_aluguel
            , sum(valor_aluguel) as valor_total_aluguel
            , count(*) as qts_filmes_alugados
        from fact_alugueis
        group by id_funcionario
            , funcionario_nome_completo
            , id_cliente
            , cliente_nome_completo
            , data_aluguel
    )

    select 
        data_aluguel
        , sum(valor_total_aluguel) as valor_total_aluguel_no_dia
        , sum(valor_total_aluguel) / count(*) as ticket_medio_dia
    from group_by_data_aluguel
    group by data_aluguel
    order by data_aluguel



