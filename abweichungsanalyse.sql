SELECT budget.KostenstellenID, budget.KontoID, budget.Periode,
       aggregiert.Ist_Summe, budget.Betrag_Plan,
       ROUND(aggregiert.Ist_Summe - budget.Betrag_Plan, 2) AS Abweichung,
       ROUND((aggregiert.Ist_Summe - budget.Betrag_Plan) / budget.Betrag_Plan * 100, 1) AS Abweichung_Prozent
FROM budget
JOIN (
    SELECT KostenstellenID, KontoID, SUBSTR(Datum, 1, 7) AS Monat, SUM(Betrag_Ist) AS Ist_Summe
    FROM buchungen
    GROUP BY KostenstellenID, KontoID, Monat
) AS aggregiert
ON budget.KostenstellenID = aggregiert.KostenstellenID
AND budget.KontoID = aggregiert.KontoID
AND budget.Periode = aggregiert.Monat
WHERE Abweichung > 2500 OR Abweichung < -2500
ORDER BY ABS(Abweichung) DESC
LIMIT 10;