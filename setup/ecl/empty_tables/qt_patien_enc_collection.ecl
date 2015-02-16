Layout_qt_patient_enc_collection := RECORD
  UNSIGNED5 patient_enc_coll_id;
  UNSIGNED5 result_instance_id;
  UNSIGNED5 set_index;
  UNSIGNED5 patient_num;
  UNSIGNED5 encounter_num;
END;
qt_patient_enc_collection := DATASET([], Layout_qt_patient_enc_collection, FLAT);
OUTPUT(qt_patient_enc_collection,,'~i2b2demodata::qt_patient_enc_collection',OVERWRITE);
