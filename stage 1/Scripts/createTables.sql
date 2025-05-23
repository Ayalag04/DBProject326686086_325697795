CREATE TABLE Hotel (
    HotelID SERIAL PRIMARY KEY,
    HotelName VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    StarRating INT
);

CREATE TABLE Room (
    RoomID SERIAL PRIMARY KEY,
    Type VARCHAR(100),
    CostPerNight NUMERIC(10,2),
    NumOfBeds INT,
    RoonStatus VARCHAR(50),
    HotelID INT REFERENCES Hotel(HotelID) ON DELETE CASCADE
);

CREATE TABLE Person (
    PID SERIAL PRIMARY KEY,
    PName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Employee (
    PID INT PRIMARY KEY REFERENCES Person(PID),
    Tenure INT,
    Salary NUMERIC(10,2),
    Role VARCHAR(100)
);

CREATE TABLE Guest (
    PID INT PRIMARY KEY REFERENCES Person(PID)
);

CREATE TABLE Reservation (
    RID SERIAL PRIMARY KEY,
    BookingDate DATE,
    CheckinDate DATE,
    CheckoutDate DATE,
	Rstatus VARCHAR(50),
    GuestID INT REFERENCES Guest(PID) ON DELETE CASCADE
);


CREATE TABLE Includes (
    RID INT REFERENCES Reservation(RID) ON DELETE CASCADE,
    RoomID INT REFERENCES Room(RoomID) ON DELETE CASCADE,
    PRIMARY KEY (RID, RoomID)
);

CREATE TABLE Settles (
    RID INT PRIMARY KEY REFERENCES Reservation(RID) ON DELETE CASCADE,
    PayID INT UNIQUE REFERENCES Payment(PayID) ON DELETE CASCADE
);

CREATE TABLE Responsible (
    PID INT REFERENCES Employee(PID) ON DELETE CASCADE,
    RoomID INT REFERENCES Room(RoomID) ON DELETE CASCADE,
    PRIMARY KEY (PID, RoomID)
);

CREATE TABLE Payment (
    PayID SERIAL PRIMARY KEY,
    TotalPay NUMERIC(10,2),
    PaymentMethod VARCHAR(50)
);
