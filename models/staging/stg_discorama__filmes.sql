with
    fonte_filmes as (
       select
            cast (film_id as int) as id_filme
            , cast (title as string) as titulo_do_filme
            , cast (description as string) as descricao_do_filme
            , cast (release_year as int) as ano_lancamento_filme
            , cast (language_id as int) as id_idioma
            , cast (rental_duration as int) as prazo_para_entrega_locacao
            , cast (rental_rate as numeric) as preco_da_locacao
            , cast (length as numeric) as duracao_do_filme
            , cast (replacement_cost as numeric) as preco_ressarcimento
            , cast (rating as string) as classificacao_indicativa
            , cast (left(cast(last_update as string), 10) as date) as ultima_atualizacao 
            , cast (left(cast(_fivetran_synced as string), 10) as date) as el_fivetran
        from {{ source('fivetran_discorama', 'film') }} 
    )
select *
from fonte_filmes