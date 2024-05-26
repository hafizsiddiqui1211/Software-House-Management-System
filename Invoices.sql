CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceDate DATE,
    Amount DECIMAL(15, 2),
    ClientID INT,
    ProjectID INT,
    Status VARCHAR(20),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO Invoices (InvoiceDate, Amount, ClientID, ProjectID, Status) VALUES 
('2021-02-01', 50000, 1, 1, 'Paid'),
('2021-03-01', 30000, 2, 2, 'Pending');