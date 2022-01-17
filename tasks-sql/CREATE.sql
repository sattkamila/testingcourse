CREATE TABLE Products (id INTEGER, name VARCHAR(255),manufacturer_id INTEGER, PRIMARY KEY (id));
CREATE TABLE Prices (id INTEGER, value INTEGER, product_id INTEGER, discount INTEGER, PRIMARY KEY(id));
CREATE TABLE Manufacturers (id INTEGER, name VARCHAR(255), location VARCHAR, PRIMARY KEY (id));