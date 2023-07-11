with
    fonte_pagamento as (
       select
            cast(payment_id as int) as id_pagamento
            , cast(customer_id as int) as id_cliente
            , cast(staff_id as int) as id_funcionario
            , cast(rental_id as int) as id_aluguel
            , cast(amount as numeric) as valor_aluguel
            , cast(left(cast(payment_date as string), 10) as date) as data_pagamento
            , cast(_fivetran_synced as timestamp) as el_fivetran
        from {{ source('fivetran_discorama', 'payment') }} 
    )
    
select *
from fonte_pagamento