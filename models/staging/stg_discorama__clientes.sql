with
    fonte_cliente as (
       select
            cast(customer_id as int) as id_cliente
            , cast(store_id as int) as id_loja
            , cast(first_name as string) as cliente_primeiro_nome
            , cast(last_name as string) as cliente_ultimo_nome
            , first_name || ' ' || last_name as cliente_nome_completo
            , cast(address_id as int) as id_endereco
            , cast(activebool as string) as cliente_ativo
            , cast(left(cast(create_date as string), 10) as date) as criado_atualizacao 
            , cast(left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast(left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'customer') }} 
    )
select *
from fonte_cliente
