SELECT Buchungstext, COUNT(*) AS Anzahl, SUM(Betrag_Ist) AS Summe
FROM buchungen
WHERE KostenstellenID = 'K500' AND KontoID = 'A50' AND Datum LIKE '2026-10%'
GROUP BY Buchungstext
ORDER BY Summe DESC;