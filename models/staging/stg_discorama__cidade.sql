with
    fonte_cidade as (
       select
            cast (city_id as int) as id_cidade
            , cast (city1 as string) as cidade
            , cast (country_id as int) as id_pais
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao 
        from {{ref('city')}} 
    )
select *
from fonte_cidade