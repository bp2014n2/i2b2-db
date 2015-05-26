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
echo "Running DB Setup"
echo "######################"


# setup environment
export I2B2_DB_HOME=`pwd`
cd ~
mkdir log
export LOG_FILE=`pwd`/log/db_setup_log.txt
touch $LOG_FILE
cd $I2B2_DB_HOME

echo "Installing software"
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update
    apt-get install -y ant unzip python-pip bc postgresql-9.4
    pip install six==1.8.0
    pip install awscli
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Downloading Data... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    wget -q http://54.93.194.56/i2b2createdb-1704.zip
    unzip i2b2createdb-1704.zip
    #mkdir ~/.aws
    #echo -e "[default]\naws_access_key_id=$aws_access_key_id\naws_secret_access_key=$aws_secret_access_key" >> ~/.aws/credentials
    aws s3 cp --region eu-central-1 s3://eha-hpcc/i2b2daten/19-01-2015/Datensatz.zip Datensatz.zip
    unzip Datensatz.zip
    chmod 755 -R ./Datensatz
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Building Database... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    sudo -u postgres psql -c "CREATE DATABASE i2b2;"
    sudo -u postgres psql -d i2b2 -f setup/setup_postgres.sql
    cd edu.harvard.i2b2.data/Release_1-7/NewInstall/Crcdata
    ant -f data_build.xml create_crcdata_tables_release_1-7
    ant -f data_build.xml create_procedures_release_1-7
    ant -f data_build.xml db_demodata_load_data
    cd ../Hivedata
    ant -f data_build.xml create_hivedata_tables_release_1-7
    ant -f data_build.xml db_hivedata_load_data
    cd ../Imdata
    ant -f data_build.xml create_imdata_tables_release_1-7
    ant -f data_build.xml db_imdata_load_data
    cd ../Metadata
    ant -f data_build.xml create_metadata_tables_release_1-7
    ant -f data_build.xml db_metadata_load_data
    cd ../Pmdata
    ant -f data_build.xml create_pmdata_tables_release_1-7
    ant -f data_build.xml create_triggers_release_1-7
    ant -f data_build.xml db_pmdata_load_data
    cd ../Workdata
    ant -f data_build.xml create_workdata_tables_release_1-7
    ant -f data_build.xml db_workdata_load_data
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading data... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    sudo -u postgres psql -d i2b2 -c "TRUNCATE i2b2demodata.concept_dimension;"
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/atc-concept-dimension.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/icd-concept-dimension.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/ops-concept-dimension.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/ontology.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/atc-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/icd-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/modifier_dimension.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/modifier-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/fg-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/kh-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/ops-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/visit-meta.sql
    sudo -u postgres psql -d i2b2 -f setup/insert_basecodes.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/stammdaten.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/alter-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/region-meta.sql
    sudo -u postgres psql -d i2b2 -f Datensatz/sql/geschlecht-meta.sql
    sudo -u postgres psql -d i2b2 -f setup/setup_table_access_table.sql
    sudo -u postgres psql -d i2b2 -f setup/breakdown_statistics.sql
    sudo -u postgres psql -d i2b2 -f setup/setup_girix.sql
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";