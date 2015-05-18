IMPORT STD;
Layout_visit_dimension := RECORD
  integer5 encounter_num;
  integer5 patient_num;
  string50 active_status_cd;
  string25 start_date;
  string25 end_date;
  string50 inout_cd;
  string50 location_cd;
  string900 location_path;
  integer5 length_of_stay;
  string visit_blob;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
  integer5 age_in_years;
  integer5 treatment;
 END;

//visit_dimension := DATASET('~i2b2demodata::visit_dimension.csv', Layout_visit_dimension, CSV(separator('|')));
//OUTPUT(visit_dimension,,'~i2b2demodata::visit_dimension_1431334759491',OVERWRITE);
SEQUENTIAL(STD.File.DeleteLogicalFile('~i2b2demodata::visit_dimension'),
STD.File.CreateSuperFile('~i2b2demodata::visit_dimension'),
STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::visit_dimension','~i2b2demodata::visit_dimension_1431334759491'),
STD.File.FinishSuperFileTransaction());
