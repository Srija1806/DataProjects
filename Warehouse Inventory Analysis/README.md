Project Overview
This project focuses on analyzing order counts and inventory levels for each warehouse in an imaginary supply chain database. Using SQL, this code identifies total orders processed and current inventory levels for each warehouse, which helps evaluate warehouse activity and efficiency.

Objectives
Calculate the number of unique orders for each warehouse.
Determine the current inventory level by summing up the stock of all products in each warehouse.
Provide a summary combining order activity with inventory data for each warehouse to help prioritize restocking and order allocation strategies.
Code Explanation
The SQL query is organized with two Common Table Expressions (CTEs):

OrderCounts: Calculates the total number of unique orders per warehouse.
InventoryLevels: Sums the quantity in stock for each product within each warehouse.
These CTEs are then joined in the final query to provide:

warehouseCode: The unique code of each warehouse.
total_orders: Total distinct orders associated with each warehouse.
total_inventory: Total inventory stock level within each warehouse.
The final results are ordered by the number of orders (ascending) and then by inventory level, making it easier to see warehouses with low order counts and/or low inventory, which might require restocking or redistribution of resources.
