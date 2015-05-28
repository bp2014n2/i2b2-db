IMPORT STD;
visit_dimension_record := RECORD
  integer5 encounter_num;
  integer5 patient_num;
  string50 active_status_cd;
  string25 start_date;
  string25 end_date;
  string50 inout_cd;
  string50 location_cd;
  string900 location_path;
  integer5 length_of_stay;
  string visit_blob;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
  integer5 age_in_years;
  integer5 treatment;
 END;
 
visit_dimension := DATASET('~i2b2demodata::visit_dimension', visit_dimension_record, FLAT);

visit_dimension_idx_start_date_length_of_stay_age_in_years := INDEX(visit_dimension, {start_date,length_of_stay,age_in_years}, {patient_num}, '~i2b2demodata::visit_dimension_idx_start_date_length_of_stay_age_in_years');
BUILD(visit_dimension_idx_start_date_length_of_stay_age_in_years, SORT ALL, OVERWRITE);

visit_dimension_idx_start_date := INDEX(visit_dimension, {start_date}, {patient_num}, '~i2b2demodata::visit_dimension_idx_start_date');
BUILD(visit_dimension_idx_start_date, SORT ALL, OVERWRITE);

visit_dimension_idx_start_date_treatment := INDEX(visit_dimension, {start_date}, {patient_num}, '~i2b2demodata::visit_dimension_idx_start_date_treatment');
BUILD(visit_dimension_idx_start_date_treatment, SORT ALL, OVERWRITE);

visit_dimension_treatment := INDEX(visit_dimension, {treatment}, {patient_num}, '~i2b2demodata::visit_dimension_idx_treatment');
BUILD(visit_dimension_treatment, SORT ALL, OVERWRITE);

visit_dimension_idx_length_of_stay_treatment := INDEX(visit_dimension, {length_of_stay,treatment}, {patient_num}, '~i2b2demodata::visit_dimension_idx_length_of_stay_treatment');
BUILD(visit_dimension_idx_length_of_stay_treatment, SORT ALL, OVERWRITE);

visit_dimension_idx_length_of_stay := INDEX(visit_dimension, {length_of_stay,start_date}, {patient_num}, '~i2b2demodata::visit_dimension_idx_length_of_stay');
BUILD(visit_dimension_idx_length_of_stay, SORT ALL, OVERWRITE);

visit_dimension_idx_all_queried := INDEX(visit_dimension, {start_date,age_in_years,length_of_stay,treatment}, {patient_num}, '~i2b2demodata::visit_dimension_idx_all_queried');
BUILD(visit_dimension_idx_all_queried, SORT ALL, OVERWRITE);

visit_dimension_idx_age_in_years_treatment := INDEX(visit_dimension, {age_in_years,treatment}, {patient_num}, '~i2b2demodata::visit_dimension_idx_age_in_years_treatment');
BUILD(visit_dimension_idx_age_in_years_treatment, SORT ALL, OVERWRITE);

visit_dimension_idx_age_in_years_start_date := INDEX(visit_dimension, {age_in_years,start_date}, {patient_num}, '~i2b2demodata::visit_dimension_idx_age_in_years_start_date');
BUILD(visit_dimension_idx_age_in_years_start_date, SORT ALL, OVERWRITE);

visit_dimension_idx_age_in_years := INDEX(visit_dimension, {age_in_years}, {patient_num}, '~i2b2demodata::visit_dimension_idx_age_in_years');
BUILD(visit_dimension_idx_age_in_years, SORT ALL, OVERWRITE);

description := 'XDBC:RelIndexes=[i2b2demodata::visit_dimension_idx_start_date_length_of_stay_age_in_years;i2b2demodata::visit_dimension_idx_start_date;i2b2demodata::visit_dimension_idx_treatment;i2b2demodata::visit_dimension_idx_length_of_stay_treatment;i2b2demodata::visit_dimension_idx_length_of_stay;i2b2demodata::visit_dimension_idx_all_queried;i2b2demodata::visit_dimension_idx_age_in_years_treatment;i2b2demodata::visit_dimension_idx_age_in_years_start_date;i2b2demodata::visit_dimension_idx_age_in_years;i2b2demodata::visit_dimension_idx_start_date_treatment]';
STD.File.SetFileDescription('~i2b2demodata::visit_dimension',description);