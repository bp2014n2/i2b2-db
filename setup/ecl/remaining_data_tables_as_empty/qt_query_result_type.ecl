Layout_qt_query_result_type := RECORD
  UNSIGNED5 result_type_id;
  STRING100 name;
  STRING200 description;
  STRING500 display_type_id;
  STRING3 visual_attribute_type_id;
END;
qt_query_result_type := DATASET([], Layout_qt_query_result_type, FLAT);
OUTPUT(qt_query_result_type,,'~i2b2demodata::qt_query_result_type',OVERWRITE);
