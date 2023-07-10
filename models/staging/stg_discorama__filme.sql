with
    fonte_filme as (
       select
            cast (film_id as int) as id_filme
            , cast (title as string) as titulo_do_filme
            , cast (description as string) as descricao_do_filme
            , cast (release_year as int) as ano_lancamento_filme
            , cast (language_id as int) as id_idioma
            , cast (rental_duration as int) as duracao_do_aluguel
            , cast (rental_rate as int) as avaliacao_do_aluguel
            , cast (length as int) as tamanho_do_aluguel
            , cast (replacement_cost as int) as preco_substituicao
            , cast (rating as int) as avaliacao
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast (left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'film') }} 
    )
select *
from fonte_filme