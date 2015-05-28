IMPORT STD;
avk_fdb_t_leistungskosten_record := RECORD
  integer5 patient_num;
  string25 datum;
  decimal16_2 summe_aller_kosten;
  decimal16_2 arztkosten;
  decimal16_2 zahnarztkosten;
  decimal16_2 apothekenkosten;
  decimal16_2 krankenhauskosten;
  decimal16_2 hilfsmittel;
  decimal16_2 heilmittel;
  decimal16_2 dialysesachkosten;
  decimal16_2 krankengeld;
 END;
 
avk_fdb_t_leistungskosten := DATASET('~i2b2demodata::avk_fdb_t_leistungskosten', avk_fdb_t_leistungskosten_record, FLAT);

avk_fdb_t_leistungskosten_idx_all_queried := INDEX(avk_fdb_t_leistungskosten, {patient_num, datum}, {summe_aller_kosten}, '~i2b2demodata::avk_fdb_t_leistungskosten_idx');
BUILD(avk_fdb_t_leistungskosten_idx_all_queried, SORT ALL, OVERWRITE);

description := 'XDBC:RelIndexes=[i2b2demodata::avk_fdb_t_leistungskosten_idx]';
STD.File:SetFileDescription('~i2b2demodata::avk_fdb_t_leistungskosten',desc);