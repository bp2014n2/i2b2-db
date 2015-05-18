rec := RECORD
  INTEGER5 patient_num;
	STRING25 datum;
	DECIMAL16_2 summe_aller_kosten;
	DECIMAL16_2 arztkosten;
	DECIMAL16_2 zahnarztkosten;
	DECIMAL16_2 apothekenkosten;
	DECIMAL16_2 krankenhauskosten;
	DECIMAL16_2 hilfsmittel;
	DECIMAL16_2 heilmittel;
	DECIMAL16_2 dialysesachkosten;
	DECIMAL16_2 krankengeld;
END;

kosten := DATASET('~i2b2demodata::leistungskosten.csv',rec,CSV(separator('|')));
OUTPUT(kosten,,'~i2b2demodata::avk_fdb_t_leistungskosten',overwrite);