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
echo "Running HPCC Setup"
echo "######################"


# setup environment
export I2B2_DB_HOME=`pwd`
mkdir -p $HOME/log
export LOG_FILE=$HOME/log/db_setup_log.txt
cd $I2B2_DB_HOME

echo "Installing software..."
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    wget http://cdn.hpccsystems.com/releases/CE-Candidate-5.2.2/bin/platform/hpccsystems-platform-community_5.2.2-1trusty_amd64.deb
    dpkg -i hpccsystems-platform-community_5.2.2-1trusty_amd64.deb
    apt-get install -f -y
    service hpcc-init start
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading modifier_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/modifier_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading concept_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/atc_concept_dimension.ecl
    ecl run --target=thor setup/ecl/insert_data/icd_concept_dimension.ecl
    ecl run --target=thor setup/ecl/insert_data/ops_concept_dimension_1.ecl
    ecl run --target=thor setup/ecl/insert_data/ops_concept_dimension_2.ecl
    ecl run --target=thor setup/ecl/insert_data/ops_concept_dimension_3.ecl
    ecl run --target=thor setup/ecl/insert_data/concept_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing concept_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/create_indices_for_concept_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading encounter_mapping... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_encounter_mapping.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading qt_breakdown_path... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_qt_breakdown_path.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading qt_query_result_type... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_qt_query_result_type.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading qt_query_status_type... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_qt_query_status_type.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading set_type... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_set_type.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading qt_privilege... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/fill_qt_privilege.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Creating remaining empty tables... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/insert_data/create_empty_tables.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";