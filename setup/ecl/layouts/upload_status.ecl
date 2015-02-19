EXPORT VIRTUAL upload_status := RECORD
  UNSIGNED5 upload_id;
  STRING500 upload_label;
  STRING100 user_id;
  STRING50 source_cd;
  UNSIGNED no_of_record;
  UNSIGNED loaded_record;
  UNSIGNED deleted_record;
  STRING25 load_date;
  STRING25 end_date;
  STRING100 load_status;
  STRING message;
  STRING input_file_name;
  STRING log_file_name;
  STRING500 transform_name;
END;
