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
OUTPUT(DATASET([],query_global_temp_record),,'~i2b2demodata::output_empty',OVERWRITE);
SEQUENTIAL(STD.File.CreateSuperFile('~i2b2demodata::query_global_temp'),
STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::query_global_temp','~i2b2demodata::output_empty'),
STD.File.FinishSuperFileTransaction());