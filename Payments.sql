CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentDate DATE,
    Amount DECIMAL(15, 2),
    ClientID INT,
    InvoiceID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);
INSERT INTO Payments (PaymentDate, Amount, ClientID, InvoiceID) VALUES 
('2021-02-15', 50000, 1, 1),
('2021-03-15', 30000, 2, 2);