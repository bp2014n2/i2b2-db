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
concept_dimension_record := RECORD
  STRING700 concept_path;
  STRING50 concept_cd;
  STRING2000 name_char;
  STRING concept_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
modifier_dimension_record := RECORD
  STRING700 modifier_path;
  STRING50 modifier_cd;
  STRING2000 name_char;
  STRING modifier_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
observation_fact := DATASET('~i2b2demodata::observation_fact',observation_fact_record,FLAT);
concept_dimension := DATASET('~i2b2demodata::concept_dimension',concept_dimension_record,FLAT);
modifier_dimension := DATASET('~i2b2demodata::modifier_dimension',modifier_dimension_record,FLAT);
query_global_temp := DATASET('~i2b2demodata::query_global_temp',query_global_temp_record,FLAT);
valid_pns := SET(observation_fact(
  (concept_cd IN 
    SET(concept_dimension(concept_path[1..21]='\\ICD\\F00-F99\\F30-F39\\'),concept_cd)) 
  AND (modifier_cd IN 
    SET(modifier_dimension(modifier_path[1..20]='\\Diagnosesicherheit\\'),modifier_cd)) 
  AND (valtype_cd = 'T') 
  AND (tval_char = 'G') 
  AND (start_date >= '2011-01-01T00:00:00')
  AND (start_date <= '2012-01-01T00:00:00')),patient_num);
updates := TABLE(TABLE(query_global_temp(patient_num IN valid_pns,panel_count=2),{patient_num}),
  {UNSIGNED5 encounter_num := '',
   patient_num,
   UNSIGNED5 instance_num := '',
   STRING50 concept_cd := '',
   STRING25 start_date := '',
   STRING50 provider_id := '',
   UNSIGNED5 panel_count := -1,
   UNSIGNED5 fact_count := '',
   UNSIGNED5 fact_panels := ''});
OUTPUT(query_global_temp(patient_num NOT IN valid_pns) + updates,,'~i2b2demodata::output_20150305150845',OVERWRITE);
SEQUENTIAL(
Std.File.StartSuperFileTransaction(),
STD.File.ClearSuperFile('~i2b2demodata::query_global_temp'),
STD.File.DeleteLogicalFile((STRING)'~' + Std.File.GetSuperFileSubName('~i2b2demodata::query_global_temp', 1)),
Std.File.AddSuperFile('~i2b2demodata::query_global_temp','~i2b2demodata::output_20150305150845'),
Std.File.FinishSuperFileTransaction());