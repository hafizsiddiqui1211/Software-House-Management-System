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
INSERT INTO Tasks (TaskName, StartDate, EndDate, Status, ProjectID, AssignedTo) VALUES 
('Design Database', '2021-01-01', '2021-01-15', 'Completed', 1, 1),
('Develop API', '2021-01-16', '2021-03-15', 'In Progress', 1, 1),
('Create Mockups', '2021-02-01', '2021-02-28', 'Completed', 2, 3);