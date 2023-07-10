with
    fonte_endereco as (
       select
            cast (address_id as int) as id_endereco
            , cast(address1 as string) as endereco
            , cast (city_id as int) as id_cidade
            , cast (district as string) as bairro
            , cast (phone as int) as telefone
            , cast (postal_code as int) as codigo_postal
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast (left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ref('address')}} 
    )
select *
from fonte_endereco