
-- Views

-- View: List of vehicles with manufacturer and category details
CREATE VIEW VehicleDetails AS
SELECT v.vehicle_id, v.model, v.year, v.color, v.price, m.name AS manufacturer, 
m.country, c.name AS category
FROM Vehicles v
JOIN Manufacturers m ON v.manufacturer_id = m.manufacturer_id
JOIN VehicleCategories c ON v.category_id = c.category_id;

-- View: List of orders with vehicle, customer, and total price details
CREATE VIEW OrderDetails AS
SELECT o.order_id, v.model AS vehicle_model, c.name AS customer_name, 
o.order_date, o.total_price
FROM Orders o
JOIN Vehicles v ON o.vehicle_id = v.vehicle_id
JOIN Customers c ON o.customer_id = c.customer_id;

-- View: Done and Non-Done Orders
CREATE VIEW order_status AS
SELECT
    o.order_id,
    v.model AS vehicle_model,
    c.name AS customer_name,
    o.order_date,
    o.total_price,
    CASE
        WHEN os.completed = true THEN 'Done'
        ELSE 'Not Done'
    END AS order_status
FROM Orders o
JOIN Vehicles v ON o.vehicle_id = v.vehicle_id
JOIN Customers c ON o.customer_id = c.customer_id
Left Join Orders_Status os on os.order_id=o.order_id

-- View: Delayed Completed Orders
CREATE VIEW DelayedCompletedOrders AS
SELECT
    o.order_id,
    v.model AS vehicle_model,
    c.name AS customer_name,
    o.order_date,
    os.completion_date,
    o.total_price
FROM Orders o
JOIN Vehicles v ON o.vehicle_id = v.vehicle_id
JOIN Customers c ON o.customer_id = c.customer_id
Left Join Orders_Status os on os.order_id=o.order_id
WHERE os.completed = true
AND os.completion_date > o.order_date + INTERVAL '1 month'
-- Assuming a delay threshold of 1 month, adjust as needed

-- View:Vehicle Cost
CREATE VIEW VehicleCostsView AS
SELECT Vehicles.Model, Manufacturers.Name AS Manufacturer, Costs.ManufacturingCost, Costs.ShippingCost, Costs.MarketingCost, Costs.MaintenanceCost, Costs.OtherCosts
FROM Costs
JOIN Vehicles ON Costs.Vehicle_ID = Vehicles.Vehicle_ID
JOIN Manufacturers ON Vehicles.Manufacturer_ID = Manufacturers.Manufacturer_ID;

-- View:Vehicle Net Income Profit
CREATE VIEW VehicleNetIncomeView AS
SELECT 
    Vehicles.Vehicle_ID AS VehicleID,
    Vehicles.Model,
    Manufacturers.Name AS Manufacturer,
    SUM(Orders.total_Price) AS TotalSales,
    SUM(Orders.total_Price - (Costs.ManufacturingCost + Costs.ShippingCost + Costs.MarketingCost + Costs.MaintenanceCost + Costs.OtherCosts)) AS NetIncome
FROM 
    Orders
JOIN 
    Vehicles ON Orders.Vehicle_ID = Vehicles.Vehicle_ID
JOIN 
    Manufacturers ON Vehicles.Manufacturer_ID = Manufacturers.Manufacturer_ID
JOIN 
    Costs ON Orders.Vehicle_ID = Costs.Vehicle_ID
GROUP BY 
    Vehicles.Vehicle_ID, Vehicles.Model, Manufacturers.Name;