IMPORT Std;
Layout_Obs := RECORD
 UNSIGNED5 encounter_num;
 UNSIGNED5 patient_num;
 STRING50 concept_cd;
 STRING50 provider_id;
 STRING25 start_date;
 STRING100 modifier_cd;
 UNSIGNED5 instance_num;
 STRING50 valtype_cd;
 STRING255 tval_char;
 DECIMAL18_5 nval_num;
 STRING50 valueflag_cd;
 DECIMAL18_5 quantity_num;
 STRING50 vunits_cd;
 STRING25 end_date;
 STRING50 location_cd;
 STRING observation_blob;
 DECIMAL18_5 confidence;
 STRING25 update_date;
 STRING25 download_date;
 STRING25 import_date;
 STRING50 sourcesystem_cd;
 UNSIGNED5 upload_id;
END;
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

OUTPUT(DATASET('~i2b2demodata::observation_fact',Layout_Obs,FLAT)(provider_id IN SET(DATASET('~i2b2demodata::provider_dimension',Layout_ProDim,FLAT)(Std.Str.StartsWith(provider_path,'\\PROVIDER\\ARZT\\01\\')),provider_id)),{patient_num});
