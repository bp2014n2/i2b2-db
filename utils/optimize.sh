#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

sudo -u postgres psql -d i2b2 -f $DIR/partition.sql;
sudo -u postgres psql -d i2b2 -f $DIR/cluster_partitions.sql;
sudo -u postgres psql -d i2b2 -f $DIR/partition_visit_extended.sql;
sudo -u postgres vacuumdb -d i2b2;