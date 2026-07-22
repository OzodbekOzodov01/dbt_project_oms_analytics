select 
    *
from 
    {{ source('landing', 'orderitems')}}