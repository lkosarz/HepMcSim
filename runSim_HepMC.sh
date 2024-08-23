#!/bin/bash


## Set environment
#source /opt/detector/epic-main/bin/thisepic.sh

export LOCAL_PREFIX=/gpfs/mnt/gpfs02/eic/lkosarzew/Calorimetry/Simulations/HepMcSim
#export LOCAL_PREFIX=.
source ${LOCAL_PREFIX}/epic/install/bin/thisepic.sh
export DETECTOR_PATH=${LOCAL_PREFIX}/epic/install/share/epic

## Export detector libraries
export LD_LIBRARY_PATH=${LOCAL_PREFIX}/epic/install/lib:$LD_LIBRARY_PATH

DETECTOR_CONFIG=epic_hcal_only

SIM_IN_FILE=output_10_neutron_pion.hepmc3
SIM_OUT_FILE=data/nhcal_sim_test.edm4hep.root

## Set geometry and events to simulate
DETECTOR_CONFIG=epic_backward_hcal_only
N_EVENTS=10

# Set seed based on date
SEED=$(date +%N)
#echo $SEED

OPTIONS="--compactFile ${DETECTOR_PATH}/${DETECTOR_CONFIG}.xml --numberOfEvents ${N_EVENTS} --random.seed ${SEED} --inputFiles ${SIM_IN_FILE} --outputFile ${SIM_OUT_FILE}"

echo $OPTIONS
npsim $OPTIONS

