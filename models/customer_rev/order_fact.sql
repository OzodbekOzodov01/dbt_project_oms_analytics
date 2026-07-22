select
    o.orderID,
    o.orderDate,
    o.CustomerID,
    o.EmployeeID,
    o.StoreID,
    o.Status,
    o.StatusDesc,
    count(distinct o.orderID) as OrderCount,
    sum(oi.UNITPRICE) as Revenue,
from 
    {{ ref('orders_stg') }} as o
join 
    {{ ref('orderitems_stg') }} as oi on o.orderID = oi.orderID
group by
    o.orderID,
    o.orderDate,
    o.CustomerID,
    o.EmployeeID,
    o.StoreID,
    o.Status,
    o.StatusDesc

