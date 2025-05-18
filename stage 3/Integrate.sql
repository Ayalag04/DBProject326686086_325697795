ALTER TABLE Person RENAME TO Person1;


ALTER TABLE Employee DROP CONSTRAINT Employee_personId_fkey;
ALTER TABLE Employee DROP CONSTRAINT Employee_facilityId_fkey;

ALTER TABLE Employee RENAME TO Employee1;

ALTER TABLE Employee1
  ADD CONSTRAINT Employee1_personId_fkey FOREIGN KEY (personId) REFERENCES Person1(personId);

ALTER TABLE Employee1
  ADD CONSTRAINT Employee1_facilityId_fkey FOREIGN KEY (facilityId) REFERENCES Facility(facilityId);



ALTER TABLE Payment RENAME TO Payment1;


ALTER TABLE Reservation DROP CONSTRAINT Reservation_personId_fkey;
ALTER TABLE Reservation DROP CONSTRAINT Reservation_activityId_fkey;
ALTER TABLE Reservation DROP CONSTRAINT Reservation_paymentId_fkey;

ALTER TABLE Reservation RENAME TO Reservation1;

ALTER TABLE Reservation1
  ADD CONSTRAINT Reservation1_personId_fkey FOREIGN KEY (personId) REFERENCES Visitor(personId);

ALTER TABLE Reservation1
  ADD CONSTRAINT Reservation1_activityId_fkey FOREIGN KEY (activityId) REFERENCES Activity(activityId);

ALTER TABLE Reservation1
  ADD CONSTRAINT Reservation1_paymentId_fkey FOREIGN KEY (paymentId) REFERENCES Payment1(paymentId);



ALTER TABLE Visitor DROP CONSTRAINT Visitor_personId_fkey;

ALTER TABLE Visitor
  ADD CONSTRAINT Visitor_personId_fkey FOREIGN KEY (personId) REFERENCES Person1(personId);



-- העתקת הנתונים עדכונים עבור האיחוד של הבסיסי נתונים:

ALTER TABLE person ADD COLUMN firstname VARCHAR(100);
ALTER TABLE person ADD COLUMN lastname VARCHAR(100);

--העברת השמות וחלוקה לשם פרטי ושם משפחה 
UPDATE person
SET
    firstname = split_part(pname, ' ', 1),
    lastname = split_part(pname, ' ', 2);

ALTER TABLE person DROP COLUMN pname;

ALTER TABLE person1 RENAME COLUMN phonenumber TO phone;


-- הורדת אילוצים ב- employee1
ALTER TABLE employee1 DROP CONSTRAINT employee1_personid_fkey;

-- הורדת אילוצים ב- visitor
ALTER TABLE visitor DROP CONSTRAINT visitor_personid_fkey;

-- הורדת אילוצים ב- reservation
ALTER TABLE reservation DROP CONSTRAINT reservation_personid_fkey;

--הגדלת הערכים כדי שהמפתחות יהיו שונים בהתאמה בכל הטבלאות 
UPDATE person1                   //פקודה זו נעשתה עבור ארבעת הטבלאות
SET pid = pid + 429;
 

-- החזרת אילוצים ב- employee1
ALTER TABLE employee1 ADD CONSTRAINT employee1_personid_fkey FOREIGN KEY (pid) REFERENCES person1(pid);

-- החזרת אילוצים ב- visitor
ALTER TABLE visitor ADD CONSTRAINT visitor_personid_fkey FOREIGN KEY (pid) REFERENCES person1(pid);

-- החזרת אילוצים ב- reservation
ALTER TABLE reservation ADD CONSTRAINT reservation_personid_fkey FOREIGN KEY (personId) REFERENCES visitor(personId);


INSERT INTO person (pId, firstName, phone, email, lastName)
SELECT pId, firstName, phone, email, lastName
FROM person1;

-- הסרת האילוץ בטבלה visitor שמפנה ל-person1
ALTER TABLE visitor DROP CONSTRAIN מ-employee1 ל-employee
INSERT INTO employee (role, personId, facilityId)
SELECT role, pid, facilityId
FROM employee1;


--טבלה חדשה שכילה 2 עמודות אחת של מספר 1 או 2 ועעמודה שניה שאומרת אם זה מלון או פעילות בהתאמה 
CREATE TABLE ResType (
    TId INT PRIMARY KEY,
    TypeOf VARCHAR(50) -- ערכים כמו 'מלון' או 'פעילות'
);

-- הוספת הערכים הבסיסיים:
INSERT INTO ResType (TId, TypeOf) VALUES
(1, 'מלון'),
(2, 'פעילות');

-- הוספת העמודה tid לטבלה Reservation
ALTER TABLE Reservation
ADD COLUMN tid INT;

-- הוספת מפתח זר לעמודה tid שמפנה ל-restype
ALTER TABLE Reservation
ADD CONSTRAINT reservation_tid_fkey FOREIGN KEY (tid) REFERENCES restype(tid);

-- הוספת העמודה activityid לטבלה Reservation
ALTER TABLE Reservation
ADD COLUMN activityid INT;

-- הוספת מפתח זר לעמודה activityid שמפנה ל-activity
ALTER TABLE Reservation
ADD CONSTRAINT reservation_activityid_fkey FOREIGN KEY (activityid) REFERENCES activity(activityid);

UPDATE Reservation
SET tid = 1;

ALTER TABLE Reservation
DROP CONSTRAINT IF EXISTS reservation_guestid_fkey;

ALTER TABLE Reservation
RENAME COLUMN guestid TO visitorid;

ALTER TABLE Reservation
ADD CONSTRAINT reservation_visitorid_fkey
FOREIGN KEY (visitorid) REFERENCES Visitor(pId) ON DELETE CASCADE;


INSERT INTO Reservation (rid ,bookingDate, visitorid, activityId, paymentId )
SELECT r1.reservationid, r1.reservationDate, r1.pId, r1.activityId, r1.paymentId
FROM Reservation1 r1;


UPDATE Reservation
SET tid = 2
WHERE tid IS NULL;

UPDATE payment1
SET paymentid = 400 + paymentid

ALTER TABLE payment
ADD COLUMN paymentDate DATE,
ADD COLUMN amount NUMERIC(2);


INSERT INTO payment (payid, paymentDate, amount)
SELECT paymentid, paymentDate, amount
FROM payment1;