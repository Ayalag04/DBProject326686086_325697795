ALTER TABLE Hotel
ALTER COLUMN HotelName SET NOT NULL;

ALTER TABLE Employee
ADD CONSTRAINT chk_positive_salary CHECK (Salary > 0);

ALTER TABLE Reservation
ALTER COLUMN Rstatus SET DEFAULT 'Pending';
