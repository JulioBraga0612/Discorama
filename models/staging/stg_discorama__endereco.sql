with
    fonte_endereco as (
       select
            cast(address_id as int) as id_endereco
            , cast(address as string) as endereco
            , cast(city_id as int) as id_cidade
            , cast(district as string) as bairro
            , cast(phone as int) as telefone
            , cast(postal_code as int) as codigo_postal
            , cast(last_update as timestamp) as ultima_atualizacao 
            , cast(_fivetran_synced as timestamp) as el_fivetran
        from {{ source('fivetran_discorama', 'address') }} 
    )

select *
from fonte_endereco