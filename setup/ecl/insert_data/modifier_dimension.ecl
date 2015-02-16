Layout_modDim := RECORD
  STRING700 modifier_path;
  STRING50 modifier_cd;
  STRING2000 name_char;
  STRING modifier_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
modDim := DATASET([{'\\Diagnosesicherheit\\', 'DS', 'Ambulant: Diagnosesicherheit', '', '2014-01-01 00:00:00', '', '', 'DEMO', ''},
{'\\Diagnoseart\\', 'DA', 'Stationär: Diagnoseart', '', '2014-01-01 00:00:00', '', '', 'DEMO', ''},
{'\\Prozedurtyp\\', 'PT', 'Typ', '', '2014-01-01 00:00:00', '', '', 'DEMO', ''}],Layout_modDim);
OUTPUT(modDim,,'~i2b2demodata::modifier_dimension',OVERWRITE);
