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
echo "#########################################"
echo "Loading CSV Files and Creating Indices"
echo "#########################################"


# setup environment
export I2B2_DB_HOME=`pwd`
mkdir -p $HOME/log
export LOG_FILE=$HOME/log/db_setup_log.txt
cd $I2B2_DB_HOME

echo "Loading observation_fact... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/load_csv/load_obs_f.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing observation_fact... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_observation_fact.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading avk_fdb_t_leistungskosten... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
	ecl run --target=thor setup/ecl/load_csv/load_leistungskosten.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing avk_fdb_t_leistungskosten... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_avk_fdb_t_leistungskosten.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading patient_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/load_csv/load_pat_dim.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing patient_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_patient_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading patient_mapping... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/load_csv/load_pat_map.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing patient_mapping... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_patient_mapping.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading provider_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/load_csv/load_pro_dim.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing provider_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_provider_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Loading visit_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/load_csv/load_vis_dim.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";

echo "Indexing visit_dimension... "
progress &
progPid=$!
{
    cd $I2B2_DB_HOME
    ecl run --target=thor setup/ecl/indices/creating_indices_for_visit_dimension.ecl
} >>$LOG_FILE
echo "" ; kill -13 "$progPid";