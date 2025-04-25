SELECT
    p.PID,
    P.PName,
    COUNT(*) AS NumOfRooms
FROM Responsible R
JOIN Employee E ON R.PID = E.PID
JOIN Person P ON E.PID = P.PID
GROUP BY P.PName,p.PID
HAVING COUNT(*) > 2;
