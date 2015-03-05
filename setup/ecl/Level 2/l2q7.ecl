IMPORT STD;
query_global_temp_record := RECORD
  UNSIGNED5 encounter_num;
  UNSIGNED5 patient_num;
  UNSIGNED5 instance_num,
  STRING50 concept_cd;
  STRING25 start_date;
  STRING50 provider_id;
  UNSIGNED5 panel_count;
  UNSIGNED5 fact_count;
  UNSIGNED5 fact_panels;
END;
observation_fact_record := RECORD
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
query_global_temp := DATASET('~i2b2demodata::query_global_temp',query_global_temp_record,FLAT);
oldFile := (STRING)'\'~'+Std.File.GetSuperFileSubName('~i2b2demodata::query_global_temp', 1)+'\'';
valid_pns := SET(observation_fact((provider_id IN valid_pro_ids)
	AND (start_date >= '2011-01-01T00:00:00')
	AND (start_date <= '2012-01-01T00:00:00')),patient_num);
updates := TABLE(TABLE(query_global_temp(patient_num IN valid_pns),{patient_num}),
  {UNSIGNED5 encounter_num := '',
   patient_num,
   UNSIGNED5 instance_num := '',
   STRING50 concept_cd := '',
   STRING25 start_date := '',
   STRING50 provider_id := '',
   UNSIGNED5 panel_count := 1,
   UNSIGNED5 fact_count := '',
   UNSIGNED5 fact_panels := ''});
OUTPUT(query_global_temp(patient_num NOT IN valid_pns) + updates,,'~i2b2demodata::output_20150305150840',OVERWRITE);
SEQUENTIAL(
Std.File.StartSuperFileTransaction(),
Std.File.ReplaceSuperFile(SuperFile, oldFile, '~i2b2demodata::output_20150305150840'),
Std.File.FinishSuperFileTransaction(),
Std.File.DeleteLogicalFile(oldFile));