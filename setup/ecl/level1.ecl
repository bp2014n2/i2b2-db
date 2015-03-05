﻿observation_fact_record := RECORD
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
provider_dimension_record := RECORD
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
observation_fact := DATASET('~i2b2demodata::observation_fact',observation_fact_record,FLAT);
provider_dimension := DATASET('~i2b2demodata::provider_dimension',provider_dimension_record,FLAT);
valid_ids := SET(provider_dimension(provider_path[1..18]='\\PROVIDER\\ARZT\\01\\'),provider_id);
ergebnis := observation_fact(provider_id IN valid_ids);
ergebnis_grouped := TABLE(ergebnis,{patient_num},patient_num);
count(ergebnis_grouped);