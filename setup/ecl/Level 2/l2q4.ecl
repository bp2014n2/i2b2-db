dx_record := RECORD
  UNSIGNED5 encounter_num;
  UNSIGNED5 patient_num;
  UNSIGNED5 instance_num;
  STRING50 concept_cd;
  STRING25 start_date;
  STRING50 provider_id;
  STRING25 temporal_start_date;
  STRING25 temporal_end_date;
END;
OUTPUT(DATASET([],dx_record),,'~i2b2demodata::dx',OVERWRITE);