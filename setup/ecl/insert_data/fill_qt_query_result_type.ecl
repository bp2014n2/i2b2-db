IMPORT STD;
qt_query_result_type_record := RECORD INTEGER5 result_type_id; STRING100 name; STRING200 description; STRING500 display_type_id; STRING3 visual_attribute_type_id; END;
OUTPUT(DATASET([{1, 'PATIENTSET', 'Patient set', 'LIST', 'LA'},
{2, 'PATIENT_ENCOUNTER_SET', 'Encounter set', 'LIST', 'LA'},
{3, 'XML', 'Generic query result', 'CATNUM', 'LH'},
{4, 'PATIENT_COUNT_XML', 'Number of patients', 'CATNUM', 'LA'},
{5, 'PATIENT_GENDER_COUNT_XML', 'Gender patient breakdown', 'CATNUM', 'LA'},
{8, 'PATIENT_AGE_COUNT_XML', 'Age patient breakdown', 'CATNUM', 'LA'},
{9, 'PATIENTSET', 'Timeline', 'LIST', 'LA'}
],qt_query_result_type_record),,'~i2b2demodata::qt_query_result_type1427129852378',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::qt_query_result_type', '~i2b2demodata::qt_query_result_type1427129852378'),
STD.File.FinishSuperFileTransaction());