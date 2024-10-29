Warehouse Order and Inventory Analysis


Project Overview
This project focuses on analyzing order counts and inventory levels for each warehouse in an imaginary supply chain database. Using SQL, this code identifies total orders processed and current inventory levels for each warehouse, which helps evaluate warehouse activity and efficiency.

Objectives
•	Calculate the number of unique orders for each warehouse.
•	Determine the current inventory level by summing up the stock of all products in each warehouse.
•	Provide a summary combining order activity with inventory data for each warehouse to help prioritize restocking and order allocation strategies.

Code Explanation
The SQL query is organized with two Common Table Expressions (CTEs):
1.	OrderCounts: Calculates the total number of unique orders per warehouse.
2.	InventoryLevels: Sums the quantity in stock for each product within each warehouse.
These CTEs are then joined in the final query to provide:
1. warehouseCode: The unique code of each warehouse.
2. total_orders: Total distinct orders associated with each warehouse.
3. total_inventory: Total inventory stock level within each warehouse.
The final results are ordered by the number of orders (ascending) and then by inventory level, making it easier to see warehouses with low order counts and/or low inventory, which might require restocking or redistribution of resources.

SQL Query Code

WITH OrderCounts AS (
    SELECT warehouses.warehousecode, COUNT(DISTINCT orders.ordernumber) AS total_orders
    FROM warehouses
    JOIN products ON warehouses.warehousecode = products.warehousecode
    JOIN orderdetails ON products.productcode = orderdetails.productcode
    JOIN orders ON orderdetails.ordernumber = orders.ordernumber
    GROUP BY warehouses.warehousecode
),
InventoryLevels AS (
    SELECT warehouses.warehousecode, SUM(products.quantityinstock) AS total_inventory
    FROM warehouses
    JOIN products ON warehouses.warehousecode = products.warehousecode
    GROUP BY warehouses.warehousecode
)
SELECT 
    OrderCounts.warehouseCode, 
    OrderCounts.total_orders, 
    InventoryLevels.total_inventory
FROM 
    OrderCounts 
JOIN 
    InventoryLevels ON OrderCounts.warehouseCode = InventoryLevels.warehouseCode
ORDER BY 
    OrderCounts.total_orders ASC, 
    InventoryLevels.total_inventory ASC;




![image](https://github.com/user-attachments/assets/2483bc24-9eb2-42b8-91cf-3af6ab02e22b)
