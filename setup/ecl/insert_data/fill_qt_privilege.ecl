IMPORT STD;
qt_privilege_record := RECORD STRING1500 protection_label_cd; STRING1000 dataprot_cd; STRING1000 hivemgmt_cd; INTEGER5 plugin_id; END;
OUTPUT(DATASET([{'PDO_WITHOUT_BLOB', 'DATA_LDS', 'USER', 0},
{'PDO_WITH_BLOB', 'DATA_DEID', 'USER', 0},
{'SETFINDER_QRY_WITH_DATAOBFSC', 'DATA_OBFSC', 'USER', 0},
{'SETFINDER_QRY_WITHOUT_DATAOBFSC', 'DATA_AGG', 'USER', 0},
{'UPLOAD', 'DATA_OBFSC', 'MANAGER', 0},
{'SETFINDER_QRY_WITH_LGTEXT', 'DATA_DEID', 'USER', 0}
],qt_privilege_record),,'~i2b2demodata::qt_privilege1427129851782',OVERWRITE);
SEQUENTIAL(STD.File.StartSuperFileTransaction(),
STD.File.AddSuperFile('~i2b2demodata::qt_privilege', '~i2b2demodata::qt_privilege1427129851782'),
STD.File.FinishSuperFileTransaction());