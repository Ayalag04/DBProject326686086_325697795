SELECT
    H.HotelID,
    H.HotelName,
    SUM(Ro.CostPerNight * (CheckoutDate - CheckinDate)) AS TotalIncome
FROM Hotel H
JOIN Room Ro ON H.HotelID = Ro.HotelID
JOIN Includes I ON Ro.RoomID = I.RoomID
JOIN Reservation R ON I.RID = R.RID
GROUP BY H.HotelName,H.HotelID
ORDER BY TotalIncome DESC;
