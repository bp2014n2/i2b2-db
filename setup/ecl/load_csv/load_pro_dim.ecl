IMPORT STD;
Layout_ProDim := RECORD
  string50 provider_id;
  string700 provider_path;
  string850 name_char;
  string provider_blob;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
 END;

//allPeople := DATASET('~i2b2demodata::provider_dimension.csv',Layout_ProDim,CSV(separator('|')));
//OUTPUT(allPeople,,'~i2b2demodata::provider_dimension_1431334652832',OVERWRITE);
SEQUENTIAL(
STD.File.DeleteLogicalFile('~i2b2demodata::provider_dimension'),
STD.File.CreateSuperFile('~i2b2demodata::provider_dimension'),
STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::provider_dimension','~i2b2demodata::provider_dimension_1431334652832'),
STD.File.FinishSuperFileTransaction());