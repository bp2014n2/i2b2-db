Layout_visit_dimension := RECORD
  UNSIGNED5 encounter_num integer NOT NULL,
  UNSIGNED5 patient_num integer NOT NULL,
  STRING50 active_status_cd character varying(50),
  STRING25 start_date timestamp without time zone,
  STRING25 end_date timestamp without time zone,
  STRING50 inout_cd character varying(50),
  STRING50 location_cd character varying(50),
  STRING900 location_path character varying(900),
  UNSIGNED5 length_of_stay integer,
  STRING visit_blob text,
  STRING25 update_date timestamp without time zone,
  STRING25 download_date timestamp without time zone,
  STRING25 import_date timestamp without time zone,
  STRING50 sourcesystem_cd character varying(50),
  UNSIGNED5 upload_id integer,
END;
visit_dimension := DATASET('~i2b2demodata::visit_dimension.csv', Layout_visit_dimension, CSV);
OUTPUT(visit_dimension,,'~i2b2demodata::visit_dimension',OVERWRITE);
