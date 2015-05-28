#!/bin/bash

GIRIX_LOC=localhost:9090

if [ $# -ge 1 ]
then
    GIRIX_LOC=$1
fi

sudo -u postgres psql -d i2b2 -c "UPDATE i2b2pm.pm_cell_data SET url='http://`echo $GIRIX_LOC`/i2b2/services/GIRIXService/' WHERE cell_id LIKE 'GIRIX'"