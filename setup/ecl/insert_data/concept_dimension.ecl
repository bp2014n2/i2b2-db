Layout_ConDim := RECORD
  STRING700 concept_path;
  STRING50 concept_cd;
  STRING2000 name_char;
  STRING concept_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  UNSIGNED5 upload_id;
END;
conDimIcd := DATASET('~i2b2demodata::concept_dimension_icd',Layout_ConDim,FLAT);
conDimAtc := DATASET('~i2b2demodata::concept_dimension_atc',Layout_ConDim,FLAT);
conDimOps1 := DATASET('~i2b2demodata::concept_dimension_ops_1',Layout_ConDim,FLAT);
conDimOps2 := DATASET('~i2b2demodata::concept_dimension_ops_2',Layout_ConDim,FLAT);
conDimOps3 := DATASET('~i2b2demodata::concept_dimension_ops_3',Layout_ConDim,FLAT);
conDim := conDimAtc + conDimIcd + conDimOps1 + conDimOps2 + conDimOps3;
OUTPUT(conDim,,'~i2b2demodata::concept_dimension',OVERWRITE);