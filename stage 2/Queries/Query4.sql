SELECT
    R.RID AS ReservationID,
    P.PName,
    R.BookingDate,
    R.CheckinDate,
    R.CheckoutDate
FROM Reservation R
JOIN Guest G ON R.GuestID = G.PID
JOIN Person P ON G.PID = P.PID
WHERE EXTRACT(YEAR FROM R.BookingDate) = EXTRACT(YEAR FROM CURRENT_DATE);