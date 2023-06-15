CREATE TABLE inventory (
    ItemID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    ItemName VARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    Quantity INT NOT NULL,
    ReorderLevel INT NOT NULL,
    ReorderQuantity INT NOT NULL,
    UnitCost DECIMAL(10, 2) NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    SupplierID INT NOT NULL,
    LastOrderedDate DATE NOT NULL,
    LastReceivedDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    Location VARCHAR(255),
    CHECK (ReorderQuantity>=10),
    FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID) ON UPDATE CASCADE
);


CREATE TABLE suppliers (
    SupplierID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    SupplierName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    LeadTime INT NOT NULL,
    MinimumOrderQuantity INT NOT NULL,
    PaymentTerms VARCHAR(255) NOT NULL,
    DeliveryTerms VARCHAR(255) NOT NULL,
    Notes TEXT 
);

CREATE TABLE warehouse (
    WarehouseID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    WarehouseName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Capacity DECIMAL(10, 2) NOT NULL,
    AvailableSpace DECIMAL(10, 2) NOT NULL,
    OccupancyRate DECIMAL(5, 2) NOT NULL,
    TemperatureControl VARCHAR(255) NOT NULL,
    SecurityMeasures TEXT NOT NULL,
    Notes TEXT
);

CREATE TABLE order_tracking (
    OrderID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    CustomerName VARCHAR(255) NOT NULL,
    OrderDate DATE NOT NULL,
    DeliveryDate DATE NOT NULL,
    OrderStatus VARCHAR(255) NOT NULL,
    OrderTotal DECIMAL(10, 2) NOT NULL,
    ShippingAddress VARCHAR(255) NOT NULL,
    WarehouseID INT NOT NULL,
    Carrier VARCHAR(255) NOT NULL,
    TrackingNumber VARCHAR(255) NOT NULL,
    Notes TEXT,
    FOREIGN KEY (WarehouseID) REFERENCES warehouse(WarehouseID) ON UPDATE CASCADE
);


CREATE TABLE transportation (
    TransportID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    Carrier VARCHAR(255) NOT NULL,
    DriverName VARCHAR(255) NOT NULL,
    VehicleNumber VARCHAR(255) NOT NULL,
    ShippingAddress VARCHAR(255) NOT NULL,
    DestinationAddress VARCHAR(255) NOT NULL,
    TransportDate DATE NOT NULL,
    ArrivalDate DATE NOT NULL,
    TransportStatus VARCHAR(255) NOT NULL,
    Notes TEXT
);

