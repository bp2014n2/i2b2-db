EXPORT VIRTUAL qt_pdo_query_master := RECORD
  UNSIGNED5 query_master_id;
  STRING50 user_id;
  STRING50 group_id;
  STRING25 create_date;
  STRING request_xml;
  STRING i2b2_request_xml;
END;
