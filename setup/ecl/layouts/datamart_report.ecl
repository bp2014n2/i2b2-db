EXPORT VIRTUAL datamart_report := RECORD
  UNSIGNED5 total_patient;
  UNSIGNED5 total_observationfact;
  UNSIGNED5 total_event;
  STRING25 report_date;
END;
