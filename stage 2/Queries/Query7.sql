SELECT
    P.PName,
	P.Phone,
    R.CheckinDate,
    R.CheckoutDate,
    H.HotelName,
    Ro.RoomID,
    Ro.Type
FROM Reservation R
JOIN Guest G ON R.GuestID = G.PID
JOIN Person P ON G.PID = P.PID
JOIN Includes I ON R.RID = I.RID
JOIN Room Ro ON I.RoomID = Ro.RoomID
JOIN Hotel H ON Ro.HotelID = H.HotelID
WHERE CURRENT_DATE >= R.CheckinDate
  AND CURRENT_DATE < R.CheckoutDate;
