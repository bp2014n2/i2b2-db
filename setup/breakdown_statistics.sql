UPDATE i2b2demodata.qt_breakdown_path SET value = '\\EVA_META_STAMMDATEN\Stammdaten\Alter\' WHERE name = 'PATIENT_AGE_COUNT_XML'
UPDATE i2b2demodata.qt_breakdown_path SET value = '\\EVA_META_STAMMDATEN\Stammdaten\Sex\' WHERE name = 'PATIENT_GENDER_COUNT_XML'
DELETE FROM i2b2demodata.qt_query_result_type WHERE name = 'PATIENT_RACE_COUNT_XML'