Layout_ProDim := RECORD
  STRING50 provider_id;
  STRING700 provider_path;
  STRING850 name_char;
  STRING provider_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;

allPeople := DATASET('~i2b2demodata::provider_dimension.csv',Layout_ProDim,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::provider_dimension',OVERWRITE);