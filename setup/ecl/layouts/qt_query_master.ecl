EXPORT VIRTUAL qt_query_master := RECORD
  UNSIGNED5 query_master_id;
  STRING250 name;
  STRING50 user_id;
  STRING50 group_id;
  STRING2000 master_type_cd;
  UNSIGNED5 plugin_id;
  STRING25 create_date;
  STRING25 delete_date;
  STRING3 delete_flag;
  STRING request_xml;
  STRING generated_sql;
  STRING i2b2_request_xml;
END;
