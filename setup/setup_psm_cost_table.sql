-- DROP TABLE i2b2demodata.AVK_FDB_T_Leistungskosten;

CREATE TABLE i2b2demodata.AVK_FDB_T_Leistungskosten
(
patient_num int,
datum date,
summe_aller_kosten real,
arztkosten real,
zahnarztkosten real,
apothekenkosten real,
krankenhauskosten real,
hilfsmittel real,
heilmittel real,
dialysesachkosten real,
krankengeld real
);

COPY i2b2demodata.avk_fdb_t_leistungskosten(patient_num, datum, summe_aller_kosten, arztkosten, zahnarztkosten, 
							   apothekenkosten, krankenhauskosten, hilfsmittel, heilmittel, dialysesachkosten, 
							   krankengeld) 
FROM '/home/ubuntu/leistungskosten/leistungskosten.csv' WITH DELIMITER '|' CSV;
