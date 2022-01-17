ALTER TABLE Products ADD FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers (id);
ALTER TABLE Prices ADD FOREIGN KEY (product_id) REFERENCES Products (id);