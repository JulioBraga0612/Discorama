with
    fonte_funcionarios as (
       select
            cast (staff_id as int) as id_funcionario
            , cast (first_name as string) as funcionario_primeiro_nome
            , cast (last_name as string) as funcionario_ultimo_nome
            , first_name || ' ' || last_name as cliente_nome_completo
            , cast (address_id as int) as id_endereco_funcionario
            , cast (email as string) as email_funcionario
            , cast (active as string) as funcionario_ativo
            , cast (username as string) as funcionario_username
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao
        from {{ref('staff')}} 
    )
select *
from fonte_funcionarios
