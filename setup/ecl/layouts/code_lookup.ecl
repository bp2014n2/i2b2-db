EXPORT VIRTUAL code_lookup := RECORD
  STRING100 table_cd;
  STRING100 column_cd;
  STRING50 code_cd;
  STRING650 name_char;
  STRING lookup_blob;
  STRING25 upload_date;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
