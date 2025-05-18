--טבלה זמנית 1:
CREATE VIEW GuestReservationSummary AS
SELECT 
    p.PID,
    p.firstname,
	p.lastname,
    p.Email,
    p.Phone,
    r.RID,
    r.BookingDate,
    r.CheckinDate,
    r.CheckoutDate,
    r.Rstatus AS ReservationStatus,
    rm.RoomID,
    rm.Type AS RoomType,
    rm.CostPerNight,
    rm.NumOfBeds,
    rm.RoonStatus,
    h.HotelID,
    h.HotelName,
    h.Location,
    h.StarRating,
    pay.PayID,
    pay.TotalPay,
    pay.PaymentMethod
FROM 
    Person p
JOIN 
    visitor v ON p.PID = v.PID
JOIN 
    Reservation r ON v.PID = r.visitorID
JOIN 
    Includes i ON r.RID = i.RID
JOIN 
    Room rm ON i.RoomID = rm.RoomID
JOIN 
    Hotel h ON rm.HotelID = h.HotelID
LEFT JOIN 
    Payment pay ON r.paymentid = pay.PayID;


--שאילתות:
--1.כמה הזמנות היו בכל מיקום (עיר), מה ההכנסה הכוללת ממלונות שם ומה התשלום הממוצע להזמנה
SELECT 
    Location,
    COUNT(DISTINCT RID) AS TotalReservations,
    SUM(TotalPay) AS TotalRevenue,
    AVG(TotalPay) AS AvgPayment
FROM 
    GuestReservationSummary
WHERE 
    TotalPay IS NOT NULL
GROUP BY 
    Location
ORDER BY 
    TotalRevenue DESC;

--2.רשימת אורחים שחזרו וביצעו מספר הזמנות, עם כמה הזמנות כל אחד ביצע.
SELECT 
    PID,
    firstname,
    lastname,
    Email,
    COUNT(RID) AS NumOfReservations
FROM 
    GuestReservationSummary
GROUP BY 
    PID, firstname, lastname, Email
HAVING 
    COUNT(RID) > 1
ORDER BY 
    NumOfReservations DESC;





--טבלה זמנית 2
CREATE VIEW ActivityReservationSummary AS
SELECT 
    p.pId,
    p.firstName,
    p.lastName,
    p.phone,
    p.email,
    v.isHotelGuest,
    a.activityId,
    a.name AS activityName,
    a.capacity,
    a.price,
    f.facilityId,
    f.name AS facilityName,
    f.openingHour,
    f.closingHour,
    r.rId,
    r.bookingDate,
    pay.payId,
    pay.paymentDate,
    pay.amount
FROM 
    Person p
JOIN 
    Visitor v ON p.pId = v.pId
JOIN 
    Reservation r ON v.pId = r.visitorId
JOIN 
    Activity a ON r.activityId = a.activityId
JOIN 
    Facility f ON a.facilityId = f.facilityId
LEFT JOIN 
    Payment pay ON r.paymentId = pay.payId;

--שאילתות:
--1. רשימה של 5 הפעילויות שהוזמנו הכי הרבה 
SELECT 
    activityName,
    COUNT(*) AS totalReservations
FROM 
    ActivityReservationSummary
GROUP BY 
    activityName
ORDER BY 
    totalReservations DESC
LIMIT 5;

--2. ניתוח כמה בממוצע משלמים אורחי מלון על כל סוג של פעילות
SELECT 
    activityName,
    AVG(amount) AS averagePayment
FROM 
    ActivityReservationSummary
WHERE 
    isHotelGuest = 'Y' AND amount IS NOT NULL
GROUP BY 
    activityName
ORDER BY 
    averagePayment DESC;
