Layout_qt_patient_set_collection := RECORD
  UNSIGNED patient_set_coll_id;
  UNSIGNED5 result_instance_id;
  UNSIGNED5 set_index;
  UNSIGNED5 patient_num;
END;
qt_patient_set_collection := DATASET([], Layout_qt_patient_set_collection, FLAT);
OUTPUT(qt_patient_set_collection,,'~i2b2demodata::qt_patient_set_collection',OVERWRITE);
