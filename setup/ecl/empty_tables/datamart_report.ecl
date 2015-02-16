Layout_datamart_report := RECORD
  UNSIGNED5 total_patient;
  UNSIGNED5 total_observationfact;
  UNSIGNED5 total_event;
  STRING25 report_date;
END;
datamart_report := DATASET([], Layout_datamart_report, FLAT);
OUTPUT(datamart_report,,'~i2b2demodata::datamart_report',OVERWRITE);
