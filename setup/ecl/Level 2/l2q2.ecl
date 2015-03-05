IMPORT STD;
IF(STD.File.SuperFileExists('~i2b2demodata::dx'),
  STD.File.DeleteSuperFile('~i2b2demodata::dx'),
  STD.File.DeleteLogicalFile('~i2b2demodata::dx',TRUE));