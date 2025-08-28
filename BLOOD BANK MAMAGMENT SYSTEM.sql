-- Create Database
CREATE DATABASE BloodBankDB;
GO
USE BloodBankDB;
GO

-- Table: Donor
CREATE TABLE Donor (
    DonorID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    BloodGroup VARCHAR(5),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Table: Patient
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    BloodGroupRequired VARCHAR(5),
    ContactNumber VARCHAR(15),
    DoctorName VARCHAR(100),
    HospitalName VARCHAR(100),
    Address VARCHAR(255)
);

-- Table: BloodStock
CREATE TABLE BloodStock (
    BloodGroup VARCHAR(5) PRIMARY KEY,
    QuantityAvailable INT
);

-- Table: BloodDonation
CREATE TABLE BloodDonation (
    DonationID INT PRIMARY KEY IDENTITY(1,1),
    DonorID INT,
    DonationDate DATE,
    QuantityDonated INT,
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID)
);

-- Table: BloodRequest
CREATE TABLE BloodRequest (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    RequestDate DATE,
    BloodGroup VARCHAR(5),
    QuantityRequired INT,
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (BloodGroup) REFERENCES BloodStock(BloodGroup)
);

-- Table: Staff
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100),
    Role VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Insert Donors
INSERT INTO Donor (FullName, Gender, Age, BloodGroup, ContactNumber, Email, Address) VALUES
('Ali Raza', 'Male', 28, 'A+', '03001234567', 'ali.raza@gmail.com', 'Lahore'),
('Fatima Noor', 'Female', 24, 'B+', '03011234567', 'fatima.noor@yahoo.com', 'Karachi'),
('Usman Khan', 'Male', 35, 'O-', '03111234567', 'usman.khan@hotmail.com', 'Peshawar'),
('Hina Tariq', 'Female', 29, 'AB+', '03331234567', 'hina.tariq@gmail.com', 'Rawalpindi'),
('Bilal Ahmed', 'Male', 31, 'A-', '03091234567', 'bilal.ahmed@gmail.com', 'Multan'),
('Sana Sheikh', 'Female', 22, 'B-', '03451234567', 'sana.sheikh@gmail.com', 'Hyderabad'),
('Zain Ali', 'Male', 26, 'O+', '03081234567', 'zain.ali@gmail.com', 'Islamabad'),
('Areeba Shah', 'Female', 27, 'A+', '03211234567', 'areeba.shah@gmail.com', 'Quetta'),
('Hamza Yousaf', 'Male', 30, 'AB-', '03151234567', 'hamza.yousaf@yahoo.com', 'Faisalabad'),
('Iqra Javed', 'Female', 23, 'B+', '03321234567', 'iqra.javed@hotmail.com', 'Sialkot');

-- Insert Patients
INSERT INTO Patient (FullName, Gender, Age, BloodGroupRequired, ContactNumber, DoctorName, HospitalName, Address) VALUES
('Ahmad Ali', 'Male', 40, 'O+', '03031234567', 'Dr. Shafiq', 'Jinnah Hospital', 'Lahore'),
('Mariam Bibi', 'Female', 36, 'A+', '03041234567', 'Dr. Naseem', 'Civil Hospital', 'Karachi'),
('Tariq Mehmood', 'Male', 50, 'B-', '03431234567', 'Dr. Khalid', 'Lady Reading Hospital', 'Peshawar'),
('Rabia Anwar', 'Female', 32, 'AB+', '03231234567', 'Dr. Iqbal', 'Benazir Hospital', 'Rawalpindi'),
('Sohail Khan', 'Male', 45, 'A-', '03121234567', 'Dr. Afzal', 'Nishtar Hospital', 'Multan'),
('Nida Fatima', 'Female', 29, 'O-', '03311234567', 'Dr. Sana', 'Liaquat Hospital', 'Hyderabad'),
('Asad Rehman', 'Male', 33, 'B+', '03061234567', 'Dr. Kamran', 'PIMS', 'Islamabad'),
('Hafsa Yousaf', 'Female', 38, 'AB-', '03071234567', 'Dr. Farah', 'BMC', 'Quetta'),
('Imran Ashraf', 'Male', 41, 'A+', '03231234567', 'Dr. Waseem', 'Allied Hospital', 'Faisalabad'),
('Zoya Malik', 'Female', 34, 'O+', '03421234567', 'Dr. Adnan', 'Sialkot Medical', 'Sialkot');

-- Insert Blood Stock
INSERT INTO BloodStock (BloodGroup, QuantityAvailable) VALUES
('A+', 12), ('A-', 6), ('B+', 10), ('B-', 5),
('O+', 15), ('O-', 4), ('AB+', 8), ('AB-', 3);

-- Insert Donations
INSERT INTO BloodDonation (DonorID, DonationDate, QuantityDonated) VALUES
(1, '2025-07-01', 1), (2, '2025-07-02', 1), (3, '2025-07-03', 1),
(4, '2025-07-05', 1), (5, '2025-07-06', 1), (6, '2025-07-07', 1),
(7, '2025-07-08', 1), (8, '2025-07-10', 1), (9, '2025-07-11', 1),
(10, '2025-07-12', 1);

-- Insert Requests
INSERT INTO BloodRequest (PatientID, RequestDate, BloodGroup, QuantityRequired, Status) VALUES
(1, '2025-07-13', 'O+', 2, 'Pending'), (2, '2025-07-14', 'A+', 1, 'Approved'),
(3, '2025-07-14', 'B-', 2, 'Rejected'), (4, '2025-07-15', 'AB+', 1, 'Approved'),
(5, '2025-07-16', 'A-', 2, 'Pending'), (6, '2025-07-16', 'O-', 1, 'Pending'),
(7, '2025-07-17', 'B+', 2, 'Approved'), (8, '2025-07-18', 'AB-', 1, 'Rejected'),
(9, '2025-07-19', 'A+', 1, 'Approved'), (10, '2025-07-20', 'O+', 2, 'Pending');

-- Insert Staff
INSERT INTO Staff (FullName, Role, ContactNumber, Email) VALUES
('Dr. Nabeel Ahmad', 'Admin', '03009876543', 'nabeel.ahmad@bloodbank.pk'),
('Nurse Amna Shah', 'Nurse', '03129876543', 'amna.shah@bloodbank.pk'),
('Tech Waqas Ali', 'Technician', '03239876543', 'waqas.ali@bloodbank.pk'),
('Admin Sana Rafiq', 'Admin', '03339876543', 'sana.rafiq@bloodbank.pk'),
('Nurse Imran Khan', 'Nurse', '03449876543', 'imran.khan@bloodbank.pk'),
('Tech Hira Fatima', 'Technician', '03559876543', 'hira.fatima@bloodbank.pk'),
('Admin Ali Nawaz', 'Admin', '03669876543', 'ali.nawaz@bloodbank.pk'),
('Nurse Ayesha Jan', 'Nurse', '03779876543', 'ayesha.jan@bloodbank.pk'),
('Tech Junaid Iqbal', 'Technician', '03889876543', 'junaid.iqbal@bloodbank.pk'),
('Nurse Zeeshan Raza', 'Nurse', '03999876543', 'zeeshan.raza@bloodbank.pk');

-- Procedure: Add Donation
CREATE PROCEDURE AddBloodDonation
    @DonorID INT,
    @DonationDate DATE,
    @QuantityDonated INT,
    @BloodGroup VARCHAR(5)
AS
select * from BloodStock
BEGIN
    INSERT INTO BloodDonation (DonorID, DonationDate, QuantityDonated)
    VALUES (@DonorID, @DonationDate, @QuantityDonated);

    UPDATE BloodStock
    SET QuantityAvailable = QuantityAvailable + @QuantityDonated
    WHERE BloodGroup = @BloodGroup;
END;
GO

-- Procedure: Request Blood
CREATE PROCEDURE RequestBlood
    @PatientID INT,
    @RequestDate DATE,
    @BloodGroup VARCHAR(5),
    @QuantityRequired INT
AS
BEGIN
    DECLARE @Available INT;
    SELECT @Available = QuantityAvailable FROM BloodStock WHERE BloodGroup = @BloodGroup;

    IF @Available IS NULL OR @Available < @QuantityRequired
    BEGIN
        INSERT INTO BloodRequest (PatientID, RequestDate, BloodGroup, QuantityRequired, Status)
        VALUES (@PatientID, @RequestDate, @BloodGroup, @QuantityRequired, 'Rejected');
    END
    ELSE
    BEGIN
        INSERT INTO BloodRequest (PatientID, RequestDate, BloodGroup, QuantityRequired, Status)
        VALUES (@PatientID, @RequestDate, @BloodGroup, @QuantityRequired, 'Approved');

        UPDATE BloodStock
        SET QuantityAvailable = QuantityAvailable - @QuantityRequired
        WHERE BloodGroup = @BloodGroup;
    END
END;
GO

-- View for All Donations with Donor Info
CREATE VIEW ViewDonations AS
SELECT 
    bd.DonationID, d.FullName AS DonorName, d.BloodGroup,
    bd.DonationDate, bd.QuantityDonated
FROM 
    BloodDonation bd
JOIN 
    Donor d ON bd.DonorID = d.DonorID;
GO

-- View for All Requests with Patient Info
CREATE VIEW ViewRequests AS
SELECT 
    br.RequestID, p.FullName AS PatientName, br.BloodGroup,
    br.QuantityRequired, br.Status, br.RequestDate
FROM 
    BloodRequest br
JOIN 
    Patient p ON br.PatientID = p.PatientID;
GO


SELECT * FROM BloodRequest
WHERE Status = 'Approved';

select *from  ViewRequests
where Status = 'Approved';