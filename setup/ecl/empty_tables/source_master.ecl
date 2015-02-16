Layout_source_master := RECORD
  STRING50 source_cd;
  STRING300 description;
  STRING25 create_date;
END;
source_master := DATASET([], Layout_source_master, FLAT);
OUTPUT(source_master,,'~i2b2demodata::source_master',OVERWRITE);
