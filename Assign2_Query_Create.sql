-- File: create_tables.sql

-- Table: Manufacturers
CREATE TABLE Manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Table: VehicleCategories
CREATE TABLE VehicleCategories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table: Vehicles
CREATE TABLE Vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    manufacturer_id INT NOT NULL,
    category_id INT NOT NULL,
    model VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(manufacturer_id),
    FOREIGN KEY (category_id) REFERENCES VehicleCategories(category_id)
);

-- Table: Customers
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Table: Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    vehicle_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Table: COMPLETE_ORDER
CREATE TABLE Orders_Status (
    orders_Status_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL,
	completed boolean NOT NULL,  
	completion_date Date,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Create Costs table
CREATE TABLE Costs (
    Cost_ID INT PRIMARY KEY,
    vehicle_id INT,
    ManufacturingCost DECIMAL(10, 2),
    ShippingCost DECIMAL(10, 2),
    MarketingCost DECIMAL(10, 2),
    MaintenanceCost DECIMAL(10, 2),
    OtherCosts DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);