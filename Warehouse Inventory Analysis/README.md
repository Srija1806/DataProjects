# Warehouse Order and Inventory Analysis

This SQL script calculates the total number of distinct orders and the total inventory for each warehouse. By using Common Table Expressions (CTEs), the query provides a summary of warehouse order counts and inventory levels, sorted in ascending order.

## Query Overview

The script consists of two main parts:
1. **OrderCounts CTE**: Calculates the number of distinct orders per warehouse.
2. **InventoryLevels CTE**: Calculates the total inventory per warehouse.

The final query joins these CTEs to display each warehouse’s order count and inventory level.

## SQL Code

```sql
WITH OrderCounts AS (
    SELECT 
        warehouses.warehousecode, 
        COUNT(DISTINCT orders.ordernumber) AS total_orders
    FROM 
        warehouses, products, orderdetails, orders
    WHERE 
        warehouses.warehousecode = products.warehousecode
        AND products.productcode = orderdetails.productcode
        AND orderdetails.ordernumber = orders.ordernumber
    GROUP BY 
        warehouses.warehousecode
),
InventoryLevels AS (
    SELECT 
        warehouses.warehousecode, 
        SUM(products.quantityinstock) AS total_inventory
    FROM 
        warehouses, products 
    WHERE 
        warehouses.warehousecode = products.warehousecode
    GROUP BY 
        warehouses.warehousecode 
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
```

## Explanation of the Code

### CTEs (Common Table Expressions)

- **OrderCounts**: This CTE counts the distinct orders per warehouse by joining `warehouses`, `products`, `orderdetails`, and `orders` tables.
- **InventoryLevels**: This CTE calculates the total inventory per warehouse by joining `warehouses` and `products` tables and summing up the `quantityinstock` column.

### Final Query

The main query joins the results of `OrderCounts` and `InventoryLevels` on `warehouseCode` to display:
- `warehouseCode`: Unique code for each warehouse.
- `total_orders`: Total count of distinct orders per warehouse.
- `total_inventory`: Total stock quantity per warehouse.

## Usage

To execute this SQL script:
1. Ensure your database contains `warehouses`, `products`, `orderdetails`, and `orders` tables with the required fields (`warehousecode`, `ordernumber`, `productcode`, and `quantityinstock`).
2. Run the script in your SQL environment to view each warehouse's order count and inventory level.

## Expected Output

| warehouseCode | total_orders | total_inventory |
|---------------|--------------|-----------------|
| WH001         | 45           | 3200           |
| WH002         | 60           | 2800           |
| ...           | ...          | ...            |

## Dependencies

This script requires:
- A database with tables: `warehouses`, `products`, `orderdetails`, and `orders`.
- Fields: `warehousecode`, `ordernumber`, `productcode`, and `quantityinstock`.
