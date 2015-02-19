EXPORT VIRTUAL qt_query_result_type := RECORD
  UNSIGNED5 result_type_id;
  STRING100 name;
  STRING200 description;
  STRING500 display_type_id;
  STRING3 visual_attribute_type_id;
END;
