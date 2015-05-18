Layout_Obs := RECORD
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

allPeople := DATASET('~i2b2demodata::observation_fact.csv',Layout_Obs,CSV(separator('|')));
OUTPUT(allPeople,,'~i2b2demodata::observation_fact',OVERWRITE);