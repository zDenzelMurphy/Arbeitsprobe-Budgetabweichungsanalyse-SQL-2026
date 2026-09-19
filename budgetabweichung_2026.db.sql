BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "buchungen" (
	"BuchungsID"	TEXT,
	"KostenstellenID"	TEXT,
	"KontoID"	TEXT,
	"Datum"	TEXT,
	"Betrag_Ist"	REAL,
	"Buchungstext"	TEXT
);
CREATE TABLE IF NOT EXISTS "budget" (
	"KostenstellenID"	TEXT,
	"KontoID"	TEXT,
	"Periode"	TEXT,
	"Betrag_Plan"	REAL
);
CREATE TABLE IF NOT EXISTS "konten" (
	"KontoID"	TEXT,
	"Bezeichnung"	TEXT,
	"Kategorie"	TEXT
);
CREATE TABLE IF NOT EXISTS "kostenstellen" (
	"KostenstellenID"	TEXT,
	"Name"	TEXT
);
COMMIT;
