CREATE TABLE Leaves (
    LeaveID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    Reason VARCHAR(255),
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Leaves (EmployeeID, StartDate, EndDate, Reason, Status) VALUES 
(1, '2021-04-01', '2021-04-05', 'Medical', 'Approved'),
(2, '2021-05-01', '2021-05-10', 'Vacation', 'Pending');