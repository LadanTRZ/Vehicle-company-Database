-- Insert into Manufacturers
INSERT INTO Manufacturers (name, country) VALUES
    ('Toyota', 'Japan'),
    ('Ford', 'USA'),
    ('BMW', 'Germany');

-- Insert into VehicleCategories
INSERT INTO VehicleCategories (name) VALUES
    ('Sedan'),
    ('SUV'),
    ('Sedan');

-- Insert into Vehicles
INSERT INTO Vehicles (manufacturer_id, category_id, model, year, color, price) VALUES
    (1, 1, 'Camry', 2022, 'Black', 25000.00),
    (2, 3, 'F-150', 2023, 'Red', 35000.00),
    (3, 2, 'X4', 2021, 'White', 60000.00);

-- Insert into Customers
INSERT INTO Customers (name, email) VALUES
    ('John Doe', 'john@example.com'),
    ('Jane Smith', 'jane@example.com'),
    ('Michael Johnson', 'michael@example.com');

-- Insert into Orders
INSERT INTO Orders (vehicle_id, customer_id, order_date,total_price) VALUES
    (1, 1, '2024-03-01', 25000.00), -- Order for a Toyota Camry by John Doe 
    (2, 2, '2024-02-15', 35000.00), -- Order for a Ford F-150 by Jane Smith 
    (3, 3, '2024-01-10', 60000.00); -- Order for a BMW X5 by Michael Johnson 

INSERT INTO Orders_Status (order_id, completed, completion_date) VALUES
    (1,false,NULL), -- Order for a Toyota Camry by John Doe (not completed)
    (2,true, '2024-03-05'), -- Order for a Ford F-150 by Jane Smith (completed)
    (3,true, '2024-02-15'); -- Order for a BMW X5 by Michael Johnson (completed)

-- Insert data into Costs table
INSERT INTO Costs (Cost_ID, Vehicle_ID, ManufacturingCost, ShippingCost, MarketingCost, MaintenanceCost, OtherCosts) VALUES
(1, 1, 20000.00, 500.00, 1000.00, 500.00, 1000.00),
(2, 2, 30000.00, 1000.00, 1500.00, 700.00, 2000.00);