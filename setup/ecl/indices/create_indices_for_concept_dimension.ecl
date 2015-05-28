IMPORT STD;
concept_dimension_record := RECORD
  string700 concept_path;
  string50 concept_cd;
  string2000 name_char;
  string concept_blob;
  string25 update_date;
  string25 download_date;
  string25 import_date;
  string50 sourcesystem_cd;
  integer5 upload_id;
 END;
 
concept_dimension := DATASET('~i2b2demodata::concept_dimension', concept_dimension_record, FLAT);

concept_dimension_idx_cc := INDEX(concept_dimension, {concept_cd}, {}, '~i2b2demodata::concept_dimension_idx_concept_cd');
BUILD(concept_dimension_idx_cc, SORT ALL, OVERWRITE);

concept_dimension_idx_inverted_cp := INDEX(concept_dimension, {concept_path}, {concept_cd}, '~i2b2demodata::concept_dimension_idx_inverted_concept_path');
BUILD(concept_dimension_idx_inverted_cp, SORT ALL, OVERWRITE);

description := 'XDBC:RelIndexes=[i2b2demodata::concept_dimension_idx_concept_cd;i2b2demodata::concept_dimension_idx_inverted_concept_path]';
STD.File:SetFileDescription('~i2b2demodata::concept_dimension',desc);