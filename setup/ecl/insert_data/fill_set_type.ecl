IMPORT STD;
set_type_record := RECORD INTEGER5 id; STRING500 name; STRING25 create_date; END;
OUTPUT(DATASET([{1, 'event_set', '2015-01-13 07:32:50.202048'},
{2, 'patient_set', '2015-01-13 07:32:50.20309'},
{3, 'concept_set', '2015-01-13 07:32:50.203927'},
{4, 'observer_set', '2015-01-13 07:32:50.204891'},
{5, 'observation_set', '2015-01-13 07:32:50.205716'},
{6, 'pid_set', '2015-01-13 07:32:50.206519'},
{7, 'eid_set', '2015-01-13 07:32:50.207344'},
{8, 'modifier_set', '2015-01-13 07:32:50.2082'}
],set_type_record),,'~i2b2demodata::set_type1427129853573',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::set_type', '~i2b2demodata::set_type1427129853573'),
STD.File.FinishSuperFileTransaction());