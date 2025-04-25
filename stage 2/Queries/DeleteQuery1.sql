begin;
DELETE FROM Reservation
WHERE EXTRACT(YEAR FROM CheckoutDate) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;
--commit;
--rollback;
