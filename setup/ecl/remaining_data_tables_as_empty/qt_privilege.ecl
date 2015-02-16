Layout_qt_privilege := RECORD
  STRING1500 protection_label_cd;
  STRING1000 dataprot_cd;
  STRING1000 hivemgmt_cd;
  UNSIGNED5 plugin_id;
END;
qt_privilege := DATASET([], Layout_qt_privilege, FLAT);
OUTPUT(qt_privilege,,'~i2b2demodata::qt_privilege',OVERWRITE);
