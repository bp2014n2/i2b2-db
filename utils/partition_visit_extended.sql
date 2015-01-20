ALTER TABLE i2b2demodata.visit_dimension DROP CONSTRAINT visit_dimension_pk;
DROP INDEX i2b2demodata.vd_idx_age_in_years;
DROP INDEX i2b2demodata.vd_idx_allvisitdim;
DROP INDEX i2b2demodata.vd_idx_dates;
DROP INDEX i2b2demodata.vd_idx_treatment;
DROP INDEX i2b2demodata.vd_idx_uploadid;
DROP INDEX i2b2demodata.VD_IDX_PATIENTAGE;
DROP INDEX i2b2demodata.VD_IDX_PATIENTTREATMENT;
DROP INDEX i2b2demodata.VD_IDX_PATIENTSTAY;
TRUNCATE i2b2demodata.visit_dimension;


CREATE TABLE i2b2demodata.visit_dimension_b2007 (
  CHECK (start_date < TIMESTAMP '2007-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2007 (
  CHECK (start_date >= TIMESTAMP '2007-01-01 00:00:00' AND start_date < TIMESTAMP '2008-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2008 (
  CHECK (start_date >= TIMESTAMP '2008-01-01 00:00:00' AND start_date < TIMESTAMP '2009-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2009 (
  CHECK (start_date >= TIMESTAMP '2009-01-01 00:00:00' AND start_date < TIMESTAMP '2010-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2010 (
  CHECK (start_date >= TIMESTAMP '2010-01-01 00:00:00' AND start_date < TIMESTAMP '2011-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2011 (
  CHECK (start_date >= TIMESTAMP '2011-01-01 00:00:00' AND start_date < TIMESTAMP '2012-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2012 (
  CHECK (start_date >= TIMESTAMP '2012-01-01 00:00:00' AND start_date < TIMESTAMP '2013-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2013 (
  CHECK (start_date >= TIMESTAMP '2013-01-01 00:00:00' AND start_date < TIMESTAMP '2014-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2014 (
  CHECK (start_date >= TIMESTAMP '2014-01-01 00:00:00' AND start_date < TIMESTAMP '2015-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2015 (
  CHECK (start_date >= TIMESTAMP '2015-01-01 00:00:00' AND start_date < TIMESTAMP '2016-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2016 (
  CHECK (start_date >= TIMESTAMP '2016-01-01 00:00:00' AND start_date < TIMESTAMP '2017-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_2017 (
  CHECK (start_date >= TIMESTAMP '2017-01-01 00:00:00' AND start_date < TIMESTAMP '2018-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);
CREATE TABLE i2b2demodata.visit_dimension_a2017 (
  CHECK (start_date >= TIMESTAMP '2018-01-01 00:00:00')
) INHERITS (i2b2demodata.visit_dimension);


CREATE OR REPLACE FUNCTION visit_dimension_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.start_date < TIMESTAMP '2007-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_b2007 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2007-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2008-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2007 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2008-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2009-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2008 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2009-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2010-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2009 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2010-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2011-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2010 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2011-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2012-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2011 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2012-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2013-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2012 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2013-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2014-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2013 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2014-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2015-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2014 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2015-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2016-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2015 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2016-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2017-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2016 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2017-01-01 00:00:00' AND NEW.start_date < TIMESTAMP '2018-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_2017 VALUES (NEW.*);
  ELSIF (NEW.start_date >= TIMESTAMP '2018-01-01 00:00:00') THEN
    INSERT INTO i2b2demodata.visit_dimension_a2017 VALUES (NEW.*);
  ELSE
    RAISE EXCEPTION 'Value out of range.  Fix the visit_dimension_insert_trigger() function!';
  END IF;
  RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER insert_visit_dimension_trigger
  BEFORE INSERT ON i2b2demodata.visit_dimension
  FOR EACH ROW EXECUTE PROCEDURE visit_dimension_insert_trigger();


SET constraint_exclusion = on;


COPY i2b2demodata.visit_dimension(ENCOUNTER_NUM, PATIENT_NUM, ACTIVE_STATUS_CD, START_DATE, END_DATE, INOUT_CD, LOCATION_CD, LOCATION_PATH, LENGTH_OF_STAY, VISIT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID, AGE_IN_YEARS, TREATMENT) FROM '/home/ubuntu/Datensatz/csv/visit_dimension.csv' DELIMITER '|' CSV;


ALTER TABLE i2b2demodata.visit_dimension_b2007 ADD CONSTRAINT visit_dimension_pk_b2007 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_b2007 ON i2b2demodata.visit_dimension_b2007(age_in_years);
CREATE INDEX vd_idx_allvisitdim_b2007 ON i2b2demodata.visit_dimension_b2007(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_b2007 ON i2b2demodata.visit_dimension_b2007(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_b2007 ON i2b2demodata.visit_dimension_b2007(treatment);
CREATE INDEX vd_idx_uploadid_b2007 ON i2b2demodata.visit_dimension_b2007(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_b2007 ON i2b2demodata.visit_dimension_b2007(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_b2007 ON i2b2demodata.visit_dimension_b2007(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_b2007 ON i2b2demodata.visit_dimension_b2007(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2007 ADD CONSTRAINT visit_dimension_pk_2007 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2007 ON i2b2demodata.visit_dimension_2007(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2007 ON i2b2demodata.visit_dimension_2007(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2007 ON i2b2demodata.visit_dimension_2007(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2007 ON i2b2demodata.visit_dimension_2007(treatment);
CREATE INDEX vd_idx_uploadid_2007 ON i2b2demodata.visit_dimension_2007(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2007 ON i2b2demodata.visit_dimension_2007(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2007 ON i2b2demodata.visit_dimension_2007(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2007 ON i2b2demodata.visit_dimension_2007(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2008 ADD CONSTRAINT visit_dimension_pk_2008 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2008 ON i2b2demodata.visit_dimension_2008(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2008 ON i2b2demodata.visit_dimension_2008(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2008 ON i2b2demodata.visit_dimension_2008(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2008 ON i2b2demodata.visit_dimension_2008(treatment);
CREATE INDEX vd_idx_uploadid_2008 ON i2b2demodata.visit_dimension_2008(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2008 ON i2b2demodata.visit_dimension_2008(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2008 ON i2b2demodata.visit_dimension_2008(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2008 ON i2b2demodata.visit_dimension_2008(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2009 ADD CONSTRAINT visit_dimension_pk_2009 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2009 ON i2b2demodata.visit_dimension_2009(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2009 ON i2b2demodata.visit_dimension_2009(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2009 ON i2b2demodata.visit_dimension_2009(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2009 ON i2b2demodata.visit_dimension_2009(treatment);
CREATE INDEX vd_idx_uploadid_2009 ON i2b2demodata.visit_dimension_2009(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2009 ON i2b2demodata.visit_dimension_2009(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2009 ON i2b2demodata.visit_dimension_2009(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2009 ON i2b2demodata.visit_dimension_2009(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2010 ADD CONSTRAINT visit_dimension_pk_2010 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2010 ON i2b2demodata.visit_dimension_2010(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2010 ON i2b2demodata.visit_dimension_2010(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2010 ON i2b2demodata.visit_dimension_2010(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2010 ON i2b2demodata.visit_dimension_2010(treatment);
CREATE INDEX vd_idx_uploadid_2010 ON i2b2demodata.visit_dimension_2010(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2010 ON i2b2demodata.visit_dimension_2010(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2010 ON i2b2demodata.visit_dimension_2010(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2010 ON i2b2demodata.visit_dimension_2010(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2011 ADD CONSTRAINT visit_dimension_pk_2011 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2011 ON i2b2demodata.visit_dimension_2011(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2011 ON i2b2demodata.visit_dimension_2011(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2011 ON i2b2demodata.visit_dimension_2011(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2011 ON i2b2demodata.visit_dimension_2011(treatment);
CREATE INDEX vd_idx_uploadid_2011 ON i2b2demodata.visit_dimension_2011(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2011 ON i2b2demodata.visit_dimension_2011(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2011 ON i2b2demodata.visit_dimension_2011(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2011 ON i2b2demodata.visit_dimension_2011(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2012 ADD CONSTRAINT visit_dimension_pk_2012 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2012 ON i2b2demodata.visit_dimension_2012(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2012 ON i2b2demodata.visit_dimension_2012(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2012 ON i2b2demodata.visit_dimension_2012(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2012 ON i2b2demodata.visit_dimension_2012(treatment);
CREATE INDEX vd_idx_uploadid_2012 ON i2b2demodata.visit_dimension_2012(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2012 ON i2b2demodata.visit_dimension_2012(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2012 ON i2b2demodata.visit_dimension_2012(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2012 ON i2b2demodata.visit_dimension_2012(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2013 ADD CONSTRAINT visit_dimension_pk_2013 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2013 ON i2b2demodata.visit_dimension_2013(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2013 ON i2b2demodata.visit_dimension_2013(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2013 ON i2b2demodata.visit_dimension_2013(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2013 ON i2b2demodata.visit_dimension_2013(treatment);
CREATE INDEX vd_idx_uploadid_2013 ON i2b2demodata.visit_dimension_2013(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2013 ON i2b2demodata.visit_dimension_2013(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2013 ON i2b2demodata.visit_dimension_2013(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2013 ON i2b2demodata.visit_dimension_2013(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2014 ADD CONSTRAINT visit_dimension_pk_2014 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2014 ON i2b2demodata.visit_dimension_2014(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2014 ON i2b2demodata.visit_dimension_2014(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2014 ON i2b2demodata.visit_dimension_2014(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2014 ON i2b2demodata.visit_dimension_2014(treatment);
CREATE INDEX vd_idx_uploadid_2014 ON i2b2demodata.visit_dimension_2014(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2014 ON i2b2demodata.visit_dimension_2014(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2014 ON i2b2demodata.visit_dimension_2014(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2014 ON i2b2demodata.visit_dimension_2014(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2015 ADD CONSTRAINT visit_dimension_pk_2015 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2015 ON i2b2demodata.visit_dimension_2015(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2015 ON i2b2demodata.visit_dimension_2015(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2015 ON i2b2demodata.visit_dimension_2015(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2015 ON i2b2demodata.visit_dimension_2015(treatment);
CREATE INDEX vd_idx_uploadid_2015 ON i2b2demodata.visit_dimension_2015(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2015 ON i2b2demodata.visit_dimension_2015(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2015 ON i2b2demodata.visit_dimension_2015(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2015 ON i2b2demodata.visit_dimension_2015(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2016 ADD CONSTRAINT visit_dimension_pk_2016 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2016 ON i2b2demodata.visit_dimension_2016(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2016 ON i2b2demodata.visit_dimension_2016(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2016 ON i2b2demodata.visit_dimension_2016(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2016 ON i2b2demodata.visit_dimension_2016(treatment);
CREATE INDEX vd_idx_uploadid_2016 ON i2b2demodata.visit_dimension_2016(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2016 ON i2b2demodata.visit_dimension_2016(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2016 ON i2b2demodata.visit_dimension_2016(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2016 ON i2b2demodata.visit_dimension_2016(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_2017 ADD CONSTRAINT visit_dimension_pk_2017 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_2017 ON i2b2demodata.visit_dimension_2017(age_in_years);
CREATE INDEX vd_idx_allvisitdim_2017 ON i2b2demodata.visit_dimension_2017(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_2017 ON i2b2demodata.visit_dimension_2017(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_2017 ON i2b2demodata.visit_dimension_2017(treatment);
CREATE INDEX vd_idx_uploadid_2017 ON i2b2demodata.visit_dimension_2017(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_2017 ON i2b2demodata.visit_dimension_2017(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_2017 ON i2b2demodata.visit_dimension_2017(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_2017 ON i2b2demodata.visit_dimension_2017(LENGTH_OF_STAY, PATIENT_NUM);


ALTER TABLE i2b2demodata.visit_dimension_a2017 ADD CONSTRAINT visit_dimension_pk_a2017 PRIMARY KEY(encounter_num, patient_num);
CREATE INDEX vd_idx_age_in_years_a2017 ON i2b2demodata.visit_dimension_a2017(age_in_years);
CREATE INDEX vd_idx_allvisitdim_a2017 ON i2b2demodata.visit_dimension_a2017(encounter_num, patient_num, inout_cd COLLATE pg_catalog."default", location_cd COLLATE pg_catalog."default", start_date, length_of_stay, end_date);
CREATE INDEX vd_idx_dates_a2017 ON i2b2demodata.visit_dimension_a2017(encounter_num, start_date, end_date);
CREATE INDEX vd_idx_treatment_a2017 ON i2b2demodata.visit_dimension_a2017(treatment);
CREATE INDEX vd_idx_uploadid_a2017 ON i2b2demodata.visit_dimension_a2017(upload_id);
CREATE INDEX VD_IDX_PATIENTAGE_a2017 ON i2b2demodata.visit_dimension_a2017(AGE_IN_YEARS, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTTREATMENT_a2017 ON i2b2demodata.visit_dimension_a2017(TREATMENT, PATIENT_NUM);
CREATE INDEX VD_IDX_PATIENTSTAY_a2017 ON i2b2demodata.visit_dimension_a2017(LENGTH_OF_STAY, PATIENT_NUM);

