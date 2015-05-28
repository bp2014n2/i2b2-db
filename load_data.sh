#!/bin/bash

progress() {
  pc=0;
  while true
    do
      echo -n -e "[$pc sec]\033[0K\r"
      sleep 1
      ((pc++))
    done
}

clear;
echo "######################"
echo "Loading Data"
echo "######################"

# setup environment
export I2B2_DB_HOME=`pwd`
mkdir -p $HOME/log
export LOG_FILE=$HOME/log/db_load_log.txt

DATA_LOC="s3://eha-hpcc/i2b2daten/19-01-2015/Datensatz.zip"

if [ $# -ge 1 ]
then
    DATA_LOC=$1
fi

echo "Installing software"
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    apt-get install -y unzip python-pip bc
    pip install six==1.8.0
    pip install awscli
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Downloading Data... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    aws s3 cp --region eu-central-1 $DATA_LOC Datensatz.zip
    unzip Datensatz.zip
    rm Datensatz.zip
    chmod 755 -R ./Datensatz
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading data... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    sudo -u postgres psql -d i2b2 -f setup/drop_indexes_and_constraints.sql
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.observation_fact;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.observation_fact(ENCOUNTER_NUM, PATIENT_NUM, CONCEPT_CD, PROVIDER_ID, START_DATE, MODIFIER_CD, INSTANCE_NUM, VALTYPE_CD, TVAL_CHAR, NVAL_NUM, VALUEFLAG_CD, QUANTITY_NUM, UNITS_CD, END_DATE, LOCATION_CD, OBSERVATION_BLOB, CONFIDENCE_NUM, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/observation_fact.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.patient_mapping;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.patient_mapping(PATIENT_IDE, PATIENT_IDE_SOURCE, PATIENT_NUM, PATIENT_IDE_STATUS, PROJECT_ID, UPLOAD_DATE, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/patient_mapping.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.provider_dimension;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.provider_dimension(PROVIDER_ID, PROVIDER_PATH, NAME_CHAR, PROVIDER_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/provider_dimension.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.patient_dimension;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.patient_dimension(PATIENT_NUM, VITAL_STATUS_CD, BIRTH_DATE, DEATH_DATE, SEX_CD, AGE_IN_YEARS_NUM, LANGUAGE_CD, RACE_CD, MARITAL_STATUS_CD, RELIGION_CD, ZIP_CD, STATECITYZIP_PATH, INCOME_CD, PATIENT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID) FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/patient_dimension.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.visit_dimension;"
	sudo -u postgres psql -d i2b2 -c "ALTER TABLE i2b2demodata.visit_dimension ADD COLUMN AGE_IN_YEARS INT NULL;"
	sudo -u postgres psql -d i2b2 -c "ALTER TABLE i2b2demodata.visit_dimension ADD COLUMN TREATMENT INT NULL;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.visit_dimension(ENCOUNTER_NUM, PATIENT_NUM, ACTIVE_STATUS_CD, START_DATE, END_DATE, INOUT_CD, LOCATION_CD, LOCATION_PATH, LENGTH_OF_STAY, VISIT_BLOB, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID, AGE_IN_YEARS, TREATMENT) FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/visit_dimension.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.avk_fdb_t_leistungskosten;"
	sudo -u postgres psql -d i2b2 -c "COPY i2b2demodata.avk_fdb_t_leistungskosten FROM '`echo $I2B2_DB_HOME`/Datensatz/csv/leistungskosten.csv' DELIMITER '|' CSV;"
	sudo -u postgres psql -d i2b2 -f setup/create_indexes_and_constraints.sql
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";