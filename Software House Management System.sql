-- Create database
CREATE DATABASE SoftwareHouseManagement;
USE SoftwareHouseManagement;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Create Employees table
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

-- Create Clients table
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Create Projects table
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

-- Create Tasks table
CREATE TABLE Tasks (
    TaskID INT AUTO_INCREMENT PRIMARY KEY,
    TaskName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),
    ProjectID INT,
    AssignedTo INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID)
);

-- Create Invoices table
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

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentDate DATE,
    Amount DECIMAL(15, 2),
    ClientID INT,
    InvoiceID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);

-- Create Employee_Project table
CREATE TABLE Employee_Project (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Create Leaves table
CREATE TABLE Leaves (
    LeaveID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    Reason VARCHAR(255),
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create Meetings table
CREATE TABLE Meetings (
    MeetingID INT AUTO_INCREMENT PRIMARY KEY,
    MeetingDate DATE,
    StartTime TIME,
    EndTime TIME,
    Topic VARCHAR(255),
    ProjectID INT,
    OrganizerID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (OrganizerID) REFERENCES Employees(EmployeeID)
);

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentName) VALUES 
('Development'),
('Management'),
('Design');

-- Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, JobTitle, DepartmentID, ManagerID, Salary) VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '2020-01-15', 'Software Engineer', 1, NULL, 60000),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2019-03-22', 'Project Manager', 2, NULL, 80000),
('Alice', 'Brown', 'alice.brown@example.com', '1122334455', '2021-06-30', 'UI/UX Designer', 3, 1, 55000);

-- Insert sample data into Clients
INSERT INTO Clients (ClientName, ContactPerson, Email, Phone) VALUES 
('ABC Corp', 'Michael Johnson', 'michael.johnson@abccorp.com', '1231231234'),
('XYZ Ltd', 'Sarah Lee', 'sarah.lee@xyzltd.com', '9879879876');

-- Insert sample data into Projects
INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget, ProjectManagerID, ClientID) VALUES 
('Project Alpha', '2021-01-01', '2021-12-31', 1000000, 2, 1),
('Project Beta', '2021-02-15', '2021-11-30', 500000, 2, 2);

-- Insert sample data into Tasks
INSERT INTO Tasks (TaskName, StartDate, EndDate, Status, ProjectID, AssignedTo) VALUES 
('Design Database', '2021-01-01', '2021-01-15', 'Completed', 1, 1),
('Develop API', '2021-01-16', '2021-03-15', 'In Progress', 1, 1),
('Create Mockups', '2021-02-01', '2021-02-28', 'Completed', 2, 3);

-- Insert sample data into Invoices
INSERT INTO Invoices (InvoiceDate, Amount, ClientID, ProjectID, Status) VALUES 
('2021-02-01', 50000, 1, 1, 'Paid'),
('2021-03-01', 30000, 2, 2, 'Pending');

-- Insert sample data into Payments
INSERT INTO Payments (PaymentDate, Amount, ClientID, InvoiceID) VALUES 
('2021-02-15', 50000, 1, 1),
('2021-03-15', 30000, 2, 2);

-- Insert sample data into Employee_Project
INSERT INTO Employee_Project (EmployeeID, ProjectID) VALUES 
(1, 1),
(1, 2),
(2, 1);

-- Insert sample data into Leaves
INSERT INTO Leaves (EmployeeID, StartDate, EndDate, Reason, Status) VALUES 
(1, '2021-04-01', '2021-04-05', 'Medical', 'Approved'),
(2, '2021-05-01', '2021-05-10', 'Vacation', 'Pending');

-- Insert sample data into Meetings
INSERT INTO Meetings (MeetingDate, StartTime, EndTime, Topic, ProjectID, OrganizerID) VALUES 
('2021-03-01', '10:00:00', '11:00:00', 'Project Alpha Kickoff', 1, 2),
('2021-03-15', '14:00:00', '15:00:00', 'Design Review', 2, 3);
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Clients;
SELECT * FROM Projects;
SELECT * FROM Tasks;
SELECT COUNT(*) AS TotalEmployees FROM Employees;
SELECT SUM(Budget) AS TotalBudget FROM Projects;
SELECT AVG(Salary) AS AverageSalary FROM Employees;
SELECT MAX(Salary) AS MaxSalary FROM Employees;
SELECT MIN(Salary) AS MinSalary FROM Employees;
SELECT e.*
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Development';
SELECT p.*
FROM Projects p
JOIN Employees e ON p.ProjectManagerID = e.EmployeeID
WHERE e.FirstName = 'Jane' AND e.LastName = 'Smith';
SELECT t.*
FROM Tasks t
JOIN Projects p ON t.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Project Alpha';
SELECT e1.EmployeeID, e1.FirstName, e1.LastName, e2.FirstName AS ManagerFirstName, e2.LastName AS ManagerLastName
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID;
SELECT * FROM Employees
WHERE ManagerID IS NULL;
SELECT p.ProjectName, c.ClientName
FROM Projects p
JOIN Clients c ON p.ClientID = c.ClientID;
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID;
SELECT c.ClientName, SUM(i.Amount) AS TotalInvoiced
FROM Clients c
JOIN Invoices i ON c.ClientID = i.ClientID
GROUP BY c.ClientName;
SELECT c.ClientName, SUM(p.Amount) AS TotalPaid
FROM Clients c
JOIN Payments p ON c.ClientID = p.ClientID
GROUP BY c.ClientName;
SELECT p.ProjectName, COUNT(t.TaskID) AS TaskCount
FROM Projects p
JOIN Tasks t ON p.ProjectID = t.ProjectID
GROUP BY p.ProjectName;
SELECT t.*
FROM Tasks t
JOIN Employees e ON t.AssignedTo = e.EmployeeID
WHERE e.FirstName = 'John' AND e.LastName = 'Doe';
SELECT p.ProjectName, p.Budget, COUNT(t.TaskID) AS TaskCount
FROM Projects p
LEFT JOIN Tasks t ON p.ProjectID = t.ProjectID
GROUP BY p.ProjectName, p.Budget;
SELECT * FROM Invoices
WHERE Status = 'Pending';
SELECT * FROM Invoices
WHERE Status = 'Paid';
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN Leaves l ON e.EmployeeID = l.EmployeeID;
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(l.LeaveID) AS LeaveCount
FROM Employees e
JOIN Leaves l ON e.EmployeeID = l.EmployeeID
GROUP BY e.EmployeeID;
SELECT m.*
FROM Meetings m
JOIN Projects p ON m.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Project Alpha';
SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProjectName
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;
SELECT p.ProjectName, t.TaskName
FROM Projects p
JOIN Tasks t ON p.ProjectID = t.ProjectID;
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN Projects p ON e.EmployeeID = p.ProjectManagerID;
SELECT p.ProjectName, COUNT(m.MeetingID) AS MeetingCount
FROM Projects p
JOIN Meetings m ON p.ProjectID = m.ProjectID
GROUP BY p.ProjectName;
SELECT p.ProjectName, COUNT(t.TaskID) AS TaskCount
FROM Projects p
JOIN Tasks t ON p.ProjectID = t.ProjectID
GROUP BY p.ProjectName
HAVING COUNT(t.TaskID) > 3;
SELECT c.ClientName
FROM Clients c
LEFT JOIN Payments p ON c.ClientID = p.ClientID
WHERE p.PaymentID IS NULL;
SELECT e.FirstName, e.LastName
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Project Beta';
SELECT SUM(p.Budget) AS TotalBudget
FROM Projects p
JOIN Employees e ON p.ProjectManagerID = e.EmployeeID
WHERE e.FirstName = 'Jane' AND e.LastName = 'Smith';
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
JOIN Employee_Project ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID
HAVING COUNT(ep.ProjectID) > 1;
SELECT c.ClientName, COUNT(p.ProjectID) AS ProjectCount
FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientName;
SELECT e.FirstName, e.LastName, SUM(DATEDIFF(l.EndDate, l.StartDate) + 1) AS TotalLeaveDays
FROM Employees e
JOIN Leaves l ON e.EmployeeID = l.EmployeeID
GROUP BY e.EmployeeID
HAVING TotalLeaveDays > 5;
SELECT c.ClientName, AVG(p.Budget) AS AverageBudget
FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientName;
SELECT p.ProjectName
FROM Projects p
LEFT JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
WHERE ep.EmployeeID IS NULL;
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN Employee_Project ep1 ON e.EmployeeID = ep1.EmployeeID
JOIN Projects p1 ON ep1.ProjectID = p1.ProjectID
JOIN Employee_Project ep2 ON e.EmployeeID = ep2.EmployeeID
JOIN Projects p2 ON ep2.ProjectID = p2.ProjectID
WHERE p1.ProjectName = 'Project Alpha' AND p2.ProjectName = 'Project Beta';
SELECT p.ProjectName, COUNT(i.InvoiceID) AS InvoiceCount, SUM(i.Amount) AS TotalInvoiced
FROM Projects p
JOIN Invoices i ON p.ProjectID = i.ProjectID
GROUP BY p.ProjectName;
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;
SELECT DISTINCT c.ClientName
FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
WHERE p.Budget > 500000;
SELECT p.ProjectName, COUNT(ep.EmployeeID) AS EmployeeCount
FROM Projects p
JOIN Employee_Project ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectName;
SELECT p.ProjectName, t.Status, COUNT(t.TaskID) AS TaskCount
FROM Projects p
JOIN Tasks t ON p.ProjectID = t.ProjectID
GROUP BY p.ProjectName, t.Status;
SELECT i.InvoiceID, i.InvoiceDate, SUM(p.Amount) AS TotalPaid
FROM Invoices i
JOIN Payments p ON i.InvoiceID = p.InvoiceID
GROUP BY i.InvoiceID, i.InvoiceDate;
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN Meetings m ON e.EmployeeID = m.OrganizerID;
SELECT p.ProjectName, p.Budget, SUM(i.Amount) AS TotalInvoiced
FROM Projects p
LEFT JOIN Invoices i ON p.ProjectID = i.ProjectID
GROUP BY p.ProjectName, p.Budget;
