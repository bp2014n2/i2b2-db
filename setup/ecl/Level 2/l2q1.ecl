IMPORT STD;
IF(STD.File.SuperFileExists('~i2b2demodata::query_global_temp'),
  STD.File.DeleteSuperFile('~i2b2demodata::query_global_temp'),
  STD.File.DeleteLogicalFile('~i2b2demodata::query_global_temp',TRUE));