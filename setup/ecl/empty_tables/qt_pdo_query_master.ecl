Layout_qt_pdo_query_master := RECORD
  UNSIGNED5 query_master_id;
  STRING50 user_id;
  STRING50 group_id;
  STRING25 create_date;
  STRING request_xml;
  STRING i2b2_request_xml;
END;
qt_pdo_query_master := DATASET([], Layout_qt_pdo_query_master, FLAT);
OUTPUT(qt_pdo_query_master,,'~i2b2demodata::qt_pdo_query_master',OVERWRITE);
