Layout_encounter_mapping := RECORD
  STRING200 encounter_ide;
  STRING50 encounter_ide_source;
  STRING50 project_id;
  UNSIGNED5 encounter_num;
  STRING200 patient_ide;
  STRING50 patient_ide_source;
  STRING50 encounter_ide_status;
  STRING25 upload_date;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
encounter_mapping := DATASET([], Layout_encounter_mapping, FLAT);
OUTPUT(encounter_mapping,,'~i2b2demodata::encounter_mapping',OVERWRITE);
