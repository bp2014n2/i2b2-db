IMPORT STD;
qt_query_status_type_record := RECORD INTEGER5 status_type_id; STRING100 name; STRING200 description; END;
OUTPUT(DATASET([{1, 'QUEUED', ' WAITING IN QUEUE TO START PROCESS'},
{2, 'PROCESSING', 'PROCESSING'},
{3, 'FINISHED', 'FINISHED'},
{4, 'ERROR', 'ERROR'},
{5, 'INCOMPLETE', 'INCOMPLETE'},
{6, 'COMPLETED', 'COMPLETED'},
{7, 'MEDIUM_QUEUE', 'MEDIUM QUEUE'},
{8, 'LARGE_QUEUE', 'LARGE QUEUE'},
{9, 'CANCELLED', 'CANCELLED'},
{10, 'TIMEDOUT', 'TIMEDOUT'}
],qt_query_status_type_record),,'~i2b2demodata::qt_query_status_type1427129852976',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::qt_query_status_type', '~i2b2demodata::qt_query_status_type1427129852976'),
STD.File.FinishSuperFileTransaction());