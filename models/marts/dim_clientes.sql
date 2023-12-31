with 
    stg_clientes as (
        select
            id_cliente
            , id_loja
            , cliente_primeiro_nome
            , cliente_ultimo_nome
            , cliente_nome_completo
            , id_endereco
            , cliente_ativo
            , criado_atualizacao
        from {{ref('stg_discorama__clientes')}}
    )
    
    , stg_enderecos as (
        select 
            id_endereco
            , endereco
            , id_cidade
            , bairro
            , telefone
            , codigo_postal
            , ultima_atualizacao
        from {{ref('stg_discorama__enderecos')}}
    )
    
    , stg_cidades as (
        select 
            id_cidade
            , cidade
            , id_pais
        from {{ref('stg_discorama__cidades')}}
    )
    
    , stg_pais as (
        select 
           id_pais
           , pais
        from {{ref('stg_discorama__paises')}}
    )
    
    , joined as (
        select
            stg_clientes.id_cliente
            , stg_clientes.id_loja
            , stg_clientes.cliente_nome_completo
            , stg_clientes.cliente_ativo
            , stg_enderecos.endereco
            , stg_enderecos.bairro
            , stg_cidades.cidade
            , stg_pais.pais
            , stg_enderecos.codigo_postal
            , stg_clientes.criado_atualizacao
        from stg_clientes
        left join stg_enderecos on stg_clientes.id_endereco = stg_enderecos.id_endereco
        left join stg_cidades on stg_enderecos.id_cidade = stg_cidades.id_cidade
        left join stg_pais on stg_cidades.id_pais = stg_pais.id_pais
    )

    select *
    from joined
