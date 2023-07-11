with 
    stg_alugueis as (
        select
            id_aluguel
            , id_inventario
            , id_funcionario
            , id_cliente
            , data_aluguel
            , data_devolucao
            , ultima_atualizacao
            , el_fivetran
        from {{ref('stg_discorama__alugueis')}}
    )
    
    , stg_pagametos as (
        select
            id_pagamento
            , id_cliente
            , id_funcionario
            , id_aluguel
            , valor_aluguel
            , data_pagamento
            , el_fivetran
        from {{ref('stg_discorama__pagamentos')}}
        where id_pagamento is not null
    )

    , joined as (
        select
            stg_alugueis.id_aluguel
            , stg_pagametos.id_pagamento
            , stg_alugueis.id_inventario
            , stg_alugueis.id_funcionario
            , stg_alugueis.id_cliente
            , stg_pagametos.valor_aluguel
            , stg_pagametos.data_pagamento
            , stg_alugueis.data_aluguel
            , stg_alugueis.data_devolucao
        from stg_alugueis
        left join stg_pagametos on stg_alugueis.id_aluguel = stg_pagametos.id_aluguel
    )

    , transformed as (
        select
            id_aluguel
            , id_pagamento
            , id_inventario -- dim_inventario -> dim_filmes
            , id_funcionario -- dim_funcionario
            , id_cliente -- dim_cliente (dentro id_loja)
            , valor_aluguel
            , data_pagamento
            , data_aluguel
            , data_devolucao
            , date_diff(data_devolucao, data_aluguel, day) as qts_dias_alugado
            , valor_aluguel / (case 
                when date_diff(data_devolucao, data_aluguel, day) = 0 then 1 
                else date_diff(data_devolucao, data_aluguel, day)
                end) as preco_medio_por_dia_alugado
            , count(*) over(partition by id_cliente, data_aluguel) as contagem_filmes_alugados_no_dia
        from joined
    )

    select *
    from transformed
