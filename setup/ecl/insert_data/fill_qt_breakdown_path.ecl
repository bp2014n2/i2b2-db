IMPORT STD;
qt_breakdown_path_record := RECORD STRING100 name; STRING2000 value; STRING25 create_date; STRING25 update_date; STRING50 user_id; END;
OUTPUT(DATASET([{'PATIENT_GENDER_COUNT_XML', '\\\\i2b2_DEMO\\i2b2\\Demographics\\Gender\\', '2015-01-13 07:33:51.929068', '', ''},
{'PATIENT_RACE_COUNT_XML', '\\\\i2b2_DEMO\\i2b2\\Demographics\\Race\\', '2015-01-13 07:33:51.929068', '', ''},
{'PATIENT_VITALSTATUS_COUNT_XML', '\\\\i2b2_DEMO\\i2b2\\Demographics\\Vital Status\\', '2015-01-13 07:33:51.929068', '', ''},
{'PATIENT_AGE_COUNT_XML', '\\\\i2b2_DEMO\\i2b2\\Demographics\\Age\\', '2015-01-13 07:33:51.929068', '', ''}
],qt_breakdown_path_record),,'~i2b2demodata::qt_breakdown_path1427129851191',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::qt_breakdown_path', '~i2b2demodata::qt_breakdown_path1427129851191'),
STD.File.FinishSuperFileTransaction());