#!/bin/bash


EICSHELL=./eic-shell


CONDOR_DIR=condorSim
OUT_DIR=output

mkdir ${CONDOR_DIR}
mkdir "${CONDOR_DIR}/${OUT_DIR}"

## Pass commands to eic-shell
#${EICSHELL} <<EOF

## Set environment
source /opt/detector/epic-main/bin/thisepic.sh
#source /opt/detector/setup.sh
#source epic/install/setup.sh

cd epic
rm -rf build
cmake -B build -S . -DCMAKE_INSTALL_PREFIX=install
cmake --build build -j8 -- install
cd ../

#export LOCAL_PREFIX=/gpfs/mnt/gpfs02/eic/lkosarzew/Calorimetry/Simulations/HepMcSim
export LOCAL_PREFIX=.
source ${LOCAL_PREFIX}/epic/install/bin/thisepic.sh
#source ${LOCAL_PREFIX}/epic/install/setup.sh
#export DETECTOR_PATH=${LOCAL_PREFIX}/epic/install/share/epic

## Export detector libraries
export LD_LIBRARY_PATH=${LOCAL_PREFIX}/epic/install/lib:$LD_LIBRARY_PATH

## Set geometry and events to simulate
DETECTOR_CONFIG=epic_backward_hcal_only
N_EVENTS=100

# Set seed based on date
SEED=$(date +%N)
#echo $SEED

OPTIONS="--compactFile ${DETECTOR_PATH}/${DETECTOR_CONFIG}.xml --numberOfEvents ${N_EVENTS} --random.seed ${SEED} --inputFiles ${1} --outputFile ${CONDOR_DIR}/${OUT_DIR}/${2}"

echo $OPTIONS
npsim $OPTIONS
	
exit

#EOF
