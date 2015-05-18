Layout_PatDim := RECORD
  integer5 patient_num;
  string50 vital_status_cd;
  string25 birth_date;
  string25 death_date;
  string50 sex_cd;
  integer5 age_in_years_num;
  string50 language_cd;
  string50 race_cd;
  string50 marital_status_cd;
  string50 religion_cd;
  string10 zip_cd;
  string700 statecityzip_path;
  string50 income_cd;
  string patient_blob;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
 END;
	
allPeople := DATASET('~i2b2demodata::patient_dimension.csv',Layout_PatDim,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::patient_dimension12345678',OVERWRITE);