Layout_visit_dimension := RECORD
  UNSIGNED5 encounter_num;
  UNSIGNED5 patient_num;
  STRING50 active_status_cd;
  STRING25 start_date;
  STRING25 end_date;
  STRING50 inout_cd;
  STRING50 location_cd;
  STRING900 location_path;
  UNSIGNED5 length_of_stay;
  STRING visit_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
visit_dimension := DATASET('~i2b2demodata::visit_dimension.csv', Layout_visit_dimension, CSV);
OUTPUT(visit_dimension,,'~i2b2demodata::visit_dimension',OVERWRITE);
