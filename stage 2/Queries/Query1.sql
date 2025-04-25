SELECT
    P.PID AS GuestID,
    P.PName AS GuestName,
    R.CheckinDate,
    R.CheckoutDate,
    H.HotelName,
    Ro.Type AS RoomType,
    Ro.CostPerNight
FROM Reservation R
JOIN Guest G ON R.GuestID = G.PID
JOIN Person P ON G.PID = P.PID
JOIN Includes I ON R.RID = I.RID
JOIN Room Ro ON I.RoomID = Ro.RoomID
JOIN Hotel H ON Ro.HotelID = H.HotelID
WHERE EXTRACT(MONTH FROM R.CheckinDate) = 5;
