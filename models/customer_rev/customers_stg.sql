{{ config(materialized='table')}}

select
    *,
    concat(FirstName, ' ', LastName) as CustomerName
from
    {{ source('landing', 'customers')}}