select 
    *,
    case 
        when Status = '01' then 'In Progress'
        when Status = '02' then 'Completed'
        when Status = '03' then 'Cancelled'
    end as StatusDesc,
    case 
        when StoreID = 1000 then 'Online'
        else 'Offline'
    end as Order_channel,
    current_timestamp as dbt_updated_at
from  
    {{ source('landing', 'orders')}}