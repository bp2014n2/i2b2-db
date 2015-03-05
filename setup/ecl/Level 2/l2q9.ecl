IMPORT STD;
query_global_temp_record := RECORD
  UNSIGNED5 encounter_num;
  UNSIGNED5 patient_num;
  UNSIGNED5 instance_num,
  STRING50 concept_cd;
  STRING25 start_date;
  STRING50 provider_id;
  UNSIGNED5 panel_count;
  UNSIGNED5 fact_count;
  UNSIGNED5 fact_panels;
END;
query_global_temp := DATASET('~i2b2demodata::query_global_temp',query_global_temp_record,FLAT);
OUTPUT(TABLE(query_global_temp(panel_count=2),
 {UNSIGNED5 encounter_num := '',
  patient_num,
  UNSIGNED5 instance_num := '',
  STRING50 concept_cd := '',
  STRING25 start_date := '',
  STRING50 provider_id := '',
  STRING25 temporal_start_date := '',
  STRING25 temporal_end_date := ''},
  patient_num),,'~i2b2demodata::dx',OVERWRITE);