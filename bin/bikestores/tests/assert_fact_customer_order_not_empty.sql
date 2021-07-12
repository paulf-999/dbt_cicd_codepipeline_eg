-- fact_customer_order shouldn't be empty
select  count(*) as row_count
from    {{ ref('fact_customer_order' )}}
having  row_count < 1
