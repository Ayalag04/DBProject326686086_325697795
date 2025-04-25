begin;
DELETE FROM Room
WHERE RoomID NOT IN (
    SELECT RoomID FROM Includes
)
AND RoomID NOT IN (
    SELECT RoomID FROM Responsible
);
--commit;
--rollback;
