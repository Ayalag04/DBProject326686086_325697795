SELECT
    Type,
    AVG(CostPerNight) AS AverageCost
FROM Room
GROUP BY Type
ORDER BY AverageCost DESC;
