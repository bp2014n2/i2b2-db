Layout_qt_analysis_plugin_result_type := RECORD
  UNSIGNED5 plugin_id;
  UNSIGNED5 result_type_id;
END;
qt_analysis_plugin_result_type := DATASET([], Layout_qt_analysis_plugin_result_type, FLAT);
OUTPUT(qt_analysis_plugin_result_type,,'~i2b2demodata::qt_analysis_plugin_result_type',OVERWRITE);
