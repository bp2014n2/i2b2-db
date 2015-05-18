concept_dimension_record := RECORD
  STRING700 concept_path;
  STRING50 concept_cd;
  STRING2000 name_char;
  STRING concept_blob;
  STRING25 update_date;
  STRING25 download_date;
  STRING25 import_date;
  STRING50 sourcesystem_cd;
  INTEGER5 upload_id;
END;

concept_dimension_table := DATASET('~i2b2demodata::concept_dimension', concept_dimension_record, FLAT);
concept_dimension := INDEX(concept_dimension_table, {concept_cd}, {}, '~i2b2demodata::concept_dimension_idx_concept_cd');
BUILD(concept_dimension, SORT ALL, OVERWRITE);