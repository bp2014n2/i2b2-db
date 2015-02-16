Layout_set_type := RECORD
  UNSIGNED5 id;
  STRING500 name;
  STRING25 create_date;
END;
set_type := DATASET([], Layout_set_type, FLAT);
OUTPUT(set_type,,'~i2b2demodata::set_type',OVERWRITE);
