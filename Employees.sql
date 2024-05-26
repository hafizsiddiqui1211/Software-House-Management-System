CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    HireDate DATE,
    JobTitle VARCHAR(50),
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, JobTitle, DepartmentID, ManagerID, Salary) VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-15', 'Software Engineer', 1, NULL, 60000),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2019-03-22', 'Project Manager', 2, NULL, 80000),
('Alice', 'Brown', 'alice.brown@example.com', '1122334455', '2021-06-30', 'UI/UX Designer', 3, 1, 55000);