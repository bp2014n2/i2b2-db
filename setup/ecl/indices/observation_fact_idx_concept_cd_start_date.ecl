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

observation_fact := DATASET('~i2b2demodata::observation_fact', observation_fact_record, FLAT);
observation_fact_idx_start_date := INDEX(observation_fact, {start_date,concept_cd, modifier_cd,valtype_cd,tval_char,patient_num},{}, '~i2b2demodata::observation_fact_idx_start_date');
BUILD(observation_fact_idx_start_date, SORT ALL, OVERWRITE);