Layout_qt_breakdown_path := RECORD
  STRING100 name;
  STRING2000 value;
  STRING25 create_date;
  STRING25 update_date;
  STRING50 user_id;
END;
qt_breakdown_path := DATASET([], Layout_qt_breakdown_path, FLAT);
OUTPUT(qt_breakdown_path,,'~i2b2demodata::qt_breakdown_path',OVERWRITE);
