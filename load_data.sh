DATA_LOC=pwd"/Datensatz/"

if [ $# -ge 1 ]
then
    DATA_LOC=$1
fi

sudo -u postgres psql -d i2b2 -f setup/drop_indexes_and_constraints.sql
sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.observation_fact;"
sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.observation_fact(ENCOUNTER_NUM, PATIENT_NUM, CONCEPT_CD, PROVIDER_ID, START_DATE, MODIFIER_CD, INSTANCE_NUM, VALTYPE_CD, TVAL_CHAR, NVAL_NUM, VALUEFLAG_CD, QUANTITY_NUM, UNITS_CD, END_DATE, LOCATION_CD, OBSERVATION_BLOB, CONFIDENCE_NUM, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $DATA_LOC`/csv/observation_fact.csv' DELIMITER '|' CSV;"
sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.patient_mapping;"
sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.patient_mapping(PATIENT_IDE, PATIENT_IDE_SOURCE, PATIENT_NUM, PATIENT_IDE_STATUS, PROJECT_ID, UPLOAD_DATE, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $DATA_LOC`/csv/patient_mapping.csv' DELIMITER '|' CSV;"
sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.provider_dimension;"
sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.provider_dimension(PROVIDER_ID, PROVIDER_PATH, NAME_CHAR, PROVIDER_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $DATA_LOC`/csv/provider_dimension.csv' DELIMITER '|' CSV;"
sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.patient_dimension;"
sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.patient_dimension(PATIENT_NUM, VITAL_STATUS_CD, BIRTH_DATE, DEATH_DATE, SEX_CD, AGE_IN_YEARS_NUM, LANGUAGE_CD, RACE_CD, MARITAL_STATUS_CD, RELIGION_CD, ZIP_CD, STATECITYZIP_PATH, INCOME_CD, PATIENT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $DATA_LOC`/csv/patient_dimension.csv' DELIMITER '|' CSV;"
sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.visit_dimension;"
sudo -u postgres psql -d i2b2 -c "ALTER TABLE i2b2demodata.visit_dimension ADD COLUMN AGE_IN_YEARS INT NULL;"
sudo -u postgres psql -d i2b2 -c "ALTER TABLE i2b2demodata.visit_dimension ADD COLUMN TREATMENT INT NULL;"
sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.visit_dimension(ENCOUNTER_NUM, PATIENT_NUM, ACTIVE_STATUS_CD, START_DATE, END_DATE, INOUT_CD, LOCATION_CD, LOCATION_PATH, LENGTH_OF_STAY, VISIT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID, AGE_IN_YEARS, TREATMENT) FROM '`echo $DATA_LOC`/csv/visit_dimension.csv' DELIMITER '|' CSV;"
sudo -u postgres psql -d i2b2 -f setup/create_indexes_and_constraints.sql