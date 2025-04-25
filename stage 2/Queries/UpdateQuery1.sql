begin;
UPDATE Room
SET CostPerNight = CostPerNight * 1.05
WHERE RoomID IN (
    SELECT RoomID
    FROM Includes
    GROUP BY RoomID
    HAVING COUNT(*) > 3
);
--commit;
--rollback;

