EXPORT VIRTUAL qt_query_instance := RECORD
  UNSIGNED5 query_instance_id;
  UNSIGNED5 query_master_id;
  STRING50 user_id;
  STRING50 group_id;
  STRING50 batch_mode;
  STRING25 start_date;
  STRING25 end_date;
  STRING3 delete_flag;
  UNSIGNED5 status_type_id;
  STRING message;
END;
