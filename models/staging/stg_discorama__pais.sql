with
    fonte_pais as (
       select
            cast (country_id as int) as id_pais
            , cast (country1 as string) as pais
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao 
        from {{ref('city')}} 
    )
select *
from fonte_pais