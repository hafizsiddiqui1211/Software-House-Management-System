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
INSERT INTO Meetings (MeetingDate, StartTime, EndTime, Topic, ProjectID, OrganizerID) VALUES 
('2021-03-01', '10:00:00', '11:00:00', 'Project Alpha Kickoff', 1, 2),
('2021-03-15', '14:00:00', '15:00:00', 'Design Review', 2, 3);