Arbeitsprobe-Budgetabweichungsanalyse-SQL-2026

SQL-Analyse einer synthetischen Kostenstellen-Datenbank: Soll-Ist-Vergleich per
JOIN und GROUP BY, größte Budgetabweichungen identifiziert.

Daten
Vier Tabellen (Kostenstellen, Konten, Budget, Buchungen), vollständig synthetisch
erzeugt. Buchungen liegen als Einzelbelege vor (mehrere pro Kostenstelle/Konto/Monat),
Budget liegt bereits als Monatswert vor.

Vorgehen
1. Einzelbuchungen je Kostenstelle, Konto und Monat aggregiert (GROUP BY + SUM)
2. Mit dem Budget verknüpft (JOIN über Kostenstelle, Konto, Periode)
3. Abweichung absolut und prozentual berechnet
4. Auf die größten Abweichungen gefiltert und sortiert

Finale Query: abweichungsanalyse.sql abweichungsanalyse.csv

Ergebnisse
- **K200 (Marketing) / Konto A30:** im November und Dezember 60–65 % unter Budget
- **K500 (IT) / Konto A50:** im Oktober 110 % über Budget

Ursachenanalyse (Beispiel K500/A50, Oktober)
Aufschlüsselung der Einzelbuchungen zeigt: eine einzelne Position
("Softwarelizenz", 8.189,41 €) macht rund 79 % (78,9 %) der gesamten Überschreitung aus,
nicht mehrere kleinere Buchungen. Das deutet stärker auf eine einmalige
Anschaffung als auf einen dauerhaften Kostenanstieg hin.
Query: abweichungsanalyse_moegliche_ursache.sql abweichungsanalyse_moegliche_ursache.csv

Mögliche nächste Schritte
- Für K500/A50 prüfen, ob es sich tatsächlich um eine Einmalanschaffung handelt
  (z. B. Mehrjahreslizenz im Voraus bezahlt) oder ob monatlich wiederkehrend
  mit ähnlichen Beträgen zu rechnen ist
- Für K200/A30 prüfen, ob eine geplante Kampagne ausgefallen ist, oder ob das
  Budget für Q4 grundsätzlich zu hoch angesetzt war
