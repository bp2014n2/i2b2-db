EXPORT VIRTUAL qt_query_result_instance := RECORD
  UNSIGNED5 result_instance_id;
  UNSIGNED5 query_instance_id;
  UNSIGNED5 result_type_id;
  UNSIGNED5 set_size;
  STRING25 start_date;
  STRING25 end_date;
  UNSIGNED5 status_type_id;
  STRING3 delete_flag;
  STRING message;
  STRING200 description;
  UNSIGNED5 real_set_size;
  STRING500 obfusc_method;
END;
