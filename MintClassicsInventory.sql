WITH OrderCounts AS (
    select warehouses.warehousecode, count(distinct orders.ordernumber) as total_orders
from warehouses, products, orderdetails, orders
where
warehouses.warehousecode=products.warehousecode
and 
products.productcode=orderdetails.productcode
and
orderdetails.ordernumber=orders.ordernumber
group by warehouses.warehousecode
),
InventoryLevels AS (
    select warehouses.warehousecode, sum(products.quantityinstock) as total_inventory
from warehouses, products 
where 
warehouses.warehousecode=products.warehousecode
group by warehouses.warehousecode 
)
SELECT 
    ordercounts.warehouseCode, 
    ordercounts.total_orders, 
    Inventorylevels.total_inventory
FROM 
    OrderCounts 
JOIN 
    InventoryLevels ON ordercounts.warehouseCode = inventorylevels.warehouseCode
ORDER BY 
    ordercounts.total_orders ASC, 
    inventorylevels.total_inventory ASC;
