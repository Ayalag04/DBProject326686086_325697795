INSERT INTO Hotel (HotelName, Location, StarRating) VALUES 
('Hilton', 'New York', 5),
('Marriott', 'Los Angeles', 4),
('Sheraton', 'Chicago', 3);

INSERT INTO Room (Type, CostPerNight, NumOfBeds, Status, HotelID) VALUES 
('Suite', 250.00, 2, 'Available', 1),
('Standard', 150.00, 1, 'Occupied', 2),
('Deluxe', 200.00, 2, 'Available', 3);


INSERT INTO Includes (RID, RoomID) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Settles (RID, PID) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Responsible (PID, RoomID) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Person (Email, Phone) VALUES 
('john@example.com', '1234567890'),
('jane@example.com', '0987654321'),
('mike@example.com', '1122334455');

INSERT INTO Employee (PID, Tenure, Salary, Role) VALUES 
(1, 5, 50000.00, 'Manager'),
(2, 3, 35000.00, 'Receptionist'),
(3, 2, 25000.00, 'Housekeeping');

INSERT INTO Guest (PID) VALUES 
(1),
(2),
(3);

INSERT INTO Reservation (BookingDate, CheckinDate, CheckoutDate, GuestID) VALUES 
('2024-03-01', '2024-03-10', '2024-03-15', 1),
('2024-04-01', '2024-04-05', '2024-04-10', 2),
('2024-05-01', '2024-05-05', '2024-05-10', 3);

INSERT INTO Payment (TotalPay, PaymentMethod, ReservationID) VALUES 
(500.00, 'Credit Card', 1),
(300.00, 'Cash', 2),
(400.00, 'Debit Card', 3);
