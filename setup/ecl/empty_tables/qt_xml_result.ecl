Layout_qt_xml_result := RECORD
  UNSIGNED5 xml_result_id;
  UNSIGNED5 result_instance_id;
  STRING xml_value;
END;
qt_xml_result := DATASET([], Layout_qt_xml_result, FLAT);
OUTPUT(qt_xml_result,,'~i2b2demodata::qt_xml_result',OVERWRITE);
