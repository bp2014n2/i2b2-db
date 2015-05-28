IMPORT STD;
patient_dimension_record := RECORD
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
 
patient_dimension := DATASET('~i2b2demodata::patient_dimension', patient_dimension_record, FLAT);

patient_dimension_idx_all_queried := INDEX(patient_dimension, {statecityzip_path,sex_cd,birth_date}, {patient_num}, '~i2b2demodata::patient_dimension_idx_statecityzip_path_all');
BUILD(patient_dimension_idx_all_queried, SORT ALL, OVERWRITE);

patient_dimension_idx_state := INDEX(patient_dimension, {statecityzip_path}, {patient_num}, '~i2b2demodata::patient_dimension_idx_statecityzip_path');
BUILD(patient_dimension_idx_state, SORT ALL, OVERWRITE);

patient_dimension_bd := INDEX(patient_dimension, {birth_date}, {patient_num}, '~i2b2demodata::patient_dimension_idx_birth_date');
BUILD(patient_dimension_bd, SORT ALL, OVERWRITE);

patient_dimension_idx_sex := INDEX(patient_dimension, {sex_cd, birth_date}, {patient_num}, '~i2b2demodata::patient_dimension_idx_sex_cd_birth_date');
BUILD(patient_dimension_idx_sex, SORT ALL, OVERWRITE);

description := 'XDBC:RelIndexes=[i2b2demodata::patient_dimension_idx_statecityzip_path_all;i2b2demodata::patient_dimension_idx_statecityzip_path;i2b2demodata::patient_dimension_idx_birth_date;i2b2demodata::patient_dimension_idx_sex_cd_birth_date]';
STD.File.SetFileDescription('~i2b2demodata::patient_dimension',description);