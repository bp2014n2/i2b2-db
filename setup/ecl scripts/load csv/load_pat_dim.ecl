Layout_PatDim := RECORD
  UNSIGNED5 patient_num;
  STRING50 vital_status_cd;
  STRING25 birth_date;
  STRING25 death_date;
  STRING50 sex_cd;
  UNSIGNED2 age_in_years_num;
  STRING50 language_cd;
  STRING50 race_cd;
  STRING50 marital_status_cd;
  STRING50 religion_cd;
  STRING10 zip_cd;
  STRING700 statecityzip_path;
  STRING50 income_cd;
  STRING patient_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
  END;
	
allPeople := DATASET('~i2b2demodata::patient_dimension.csv',Layout_PatDim,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::patient_dimension',OVERWRITE);