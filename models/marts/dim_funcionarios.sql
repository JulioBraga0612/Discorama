with
    stg_funcionarios as (
        select 
            id_funcionario
            , funcionario_nome_completo
        from {{ ref('stg_discorama__funcionarios') }}
    )

    select *
    from stg_funcionarios