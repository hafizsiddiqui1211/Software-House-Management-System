CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2),
    ProjectManagerID INT,
    ClientID INT,
    FOREIGN KEY (ProjectManagerID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget, ProjectManagerID, ClientID) VALUES 
('Project Alpha', '2021-01-01', '2021-12-31', 1000000, 2, 1),
('Project Beta', '2021-02-15', '2021-11-30', 500000, 2, 2);