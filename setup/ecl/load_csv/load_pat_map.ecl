Layout_PatMap := RECORD  
  STRING200 patient_ide;
  STRING50 patient_ide_source;
  UNSIGNED5 patient_num;
  STRING50 patient_ide_status;
  STRING50 project_id;
  STRING25 upload_date;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
	
allPeople := DATASET('~i2b2demodata::patient_mapping.csv',Layout_PatMap,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::patient_mapping',OVERWRITE);