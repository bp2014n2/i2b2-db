IMPORT STD;
Layout_PatMap := RECORD  
  STRING200 patient_ide;
  STRING50 patient_ide_source;
  INTEGER5 patient_num;
  STRING50 patient_ide_status;
  STRING50 project_id;
  STRING25 upload_date;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  INTEGER5 upload_id;
END;
	
allPeople := DATASET('~i2b2demodata::patient_mapping.csv',Layout_PatMap,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::patient_mapping12345678',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
//STD.File.CreateSuperFile('~i2b2demodata::observation_fact'),
STD.File.AddSuperFile('~i2b2demodata::patient_mapping','~i2b2demodata::patient_mapping12345678'),
STD.File.FinishSuperFileTransaction());