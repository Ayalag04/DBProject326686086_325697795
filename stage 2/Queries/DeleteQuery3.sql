begin;
DELETE FROM Guest
WHERE PID NOT IN (
    SELECT GuestID FROM Reservation
);
--commit;
--rollback;

