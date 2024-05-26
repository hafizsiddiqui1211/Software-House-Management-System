CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ClientName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
INSERT INTO Clients (ClientName, ContactPerson, Email, Phone) VALUES 
('ABC Corp', 'Michael Johnson', 'michael.johnson@abccorp.com', '1231231234'),
('XYZ Ltd', 'Sarah Lee', 'sarah.lee@xyzltd.com', '9879879876');