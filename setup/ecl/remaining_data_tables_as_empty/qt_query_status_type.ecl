Layout_qt_query_status_type := RECORD
  UNSIGNED5 status_type_id;
  STRING100 name;
  STRING200 description;
END;
qt_query_status_type := DATASET([], Layout_qt_query_status_type, FLAT);
OUTPUT(qt_query_status_type,,'~i2b2demodata::qt_query_status_type',OVERWRITE);
