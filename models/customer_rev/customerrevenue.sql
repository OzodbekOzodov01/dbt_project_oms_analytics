{{ config(materialized='table')}}

select
    ord.CUSTOMERID,
    c.CustomerName,
    sum(ord.OrderCount) as OrderCount,
    sum(ord.Revenue) as Revenue
from
    {{ ref('order_fact') }} as ord
join
    {{ ref('customers_stg') }} as c
    on ord.CUSTOMERID = c.CustomerID
group by
    ord.CUSTOMERID,
    c.CustomerName