CREATE TABLE Employee_Project (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO Employee_Project (EmployeeID, ProjectID) VALUES 
(1, 1),
(1, 2),
(2, 1);