IMPORT STD;
observation_fact_record := RECORD
  integer5 encounter_num;
  integer5 patient_num;
  string50 concept_cd;
  string50 provider_id;
  string25 start_date;
  string100 modifier_cd;
  integer5 instance_num;
  string50 valtype_cd;
  string255 tval_char;
  decimal18_5 nval_num;
  string50 valueflag_cd;
  decimal18_5 quantity_num;
  string50 units_cd;
  string25 end_date;
  string50 location_cd;
  string observation_blob;
  decimal18_5 confidence_num;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
 END;
 
observation_fact := DATASET('~i2b2demodata::observation_fact', observation_fact_record, FLAT);

observation_fact_idx_all_queried := INDEX(observation_fact, {concept_cd,provider_id,start_date,patient_num}, {modifier_cd, tval_char, valtype_cd}, '~i2b2demodata::observation_fact_idx_all_queried');
BUILD(observation_fact_idx_all_queried, SORT ALL, OVERWRITE);

observation_fact_idx_inverted_pat := INDEX(observation_fact, {patient_num}, {}, '~i2b2demodata::observation_fact_idx_inverted_patient_num');
BUILD(observation_fact_idx_inverted_pat, SORT ALL, OVERWRITE);

observation_fact_bla := INDEX(observation_fact, {concept_cd}, {patient_num}, '~i2b2demodata::observation_fact_idx_inverted_concept_cd');
BUILD(observation_fact_bla, SORT ALL, OVERWRITE);

observation_fact_idx_provider_id_ := INDEX(observation_fact, {provider_id}, {patient_num}, '~i2b2demodata::observation_fact_idx_inverted_provider_id');
BUILD(observation_fact_idx_inverted_provider_id, SORT ALL, OVERWRITE);

observation_fact_idx_inverted_all := INDEX(observation_fact, {concept_cd,start_date,patient_num}, {encounter_num, provider_id, modifier_cd, instance_num, valtype_cd, tval_char, nval_num, valueflag_cd, quantity_num, units_cd, end_date, location_cd, observation_blob, confidence_num, update_date, download_date, import_date, sourcesystem_cd, upload_id}, '~i2b2demodata::observation_fact_idx_all');
BUILD(observation_fact_idx_inverted_concept_cd, SORT ALL, OVERWRITE);

description := 'XDBC:RelIndexes=[i2b2demodata::observation_fact_idx_all_queried;i2b2demodata::observation_fact_idx_inverted_patient_num;i2b2demodata::observation_fact_idx_inverted_concept_cd;i2b2demodata::observation_fact_idx_inverted_provider_id;i2b2demodata::observation_fact_idx_all]';
STD.File.SetFileDescription('~i2b2demodata::observation_fact',description);