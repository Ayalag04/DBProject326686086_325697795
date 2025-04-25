begin;
UPDATE Reservation
SET Rstatus = CASE
    WHEN CheckinDate > CURRENT_DATE THEN 'Upcoming'
    WHEN CheckoutDate < CURRENT_DATE THEN 'Completed'
    ELSE Rstatus 
END;
--commit;
--rollback;

