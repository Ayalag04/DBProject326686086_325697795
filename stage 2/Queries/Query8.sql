SELECT
    R.RID,
    P.PName AS GuestName,
    Pay.PaymentMethod,
    Pay.TotalPay,
    R.CheckinDate,
    R.CheckoutDate,
    Ro.Type AS RoomType
FROM Reservation R
JOIN Guest G ON R.GuestID = G.PID
JOIN Person P ON G.PID = P.PID
JOIN Settles S ON R.RID = S.RID
JOIN Payment Pay ON S.PayID = Pay.PayID
JOIN Includes I ON R.RID = I.RID
JOIN Room Ro ON I.RoomID = Ro.RoomID;
