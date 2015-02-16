﻿Layout_Obs := RECORD
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

allPeople := DATASET('~i2b2demodata::observation_fact.csv',Layout_Obs,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::observation_fact',OVERWRITE);