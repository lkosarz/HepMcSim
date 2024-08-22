#!/bin/bash

EICSHELL=./eic-shell

CONDOR_DIR=condorReco
OUT_DIR=output

mkdir ${CONDOR_DIR}
mkdir "${CONDOR_DIR}/${OUT_DIR}"


## Pass commands to eic-shell
#${EICSHELL} <<EOF

export LOCAL_PREFIX='pwd'

#cd epic
#rm -rf build
#cmake -B build -S . -DCMAKE_INSTALL_PREFIX=install
#cmake --build build -j8 -- install
#cd ../

## Set environment
source /opt/detector/epic-main/bin/thisepic.sh
#source /opt/detector/setup.sh

#source ${LOCAL_PREFIX}/install/bin/thisepic.sh
#source ${LOCAL_PREFIX}/epic/install/setup.sh
#source ${LOCAL_PREFIX}/EICrecon/bin/eicrecon-this.sh
#source ${LOCAL_PREFIX}/EICrecon/install/bin/eicrecon-this.sh

NUMBER_OF_EVENTS=1000
DDSIM_FILE=${1}
EICRECON_FILE=${2}


eicrecon $DDSIM_FILE -Ppodio:output_file=${EICRECON_FILE} -Pjana:nevents=${NUMBER_OF_EVENTS}

#eicrecon $DDSIM_FILE -Ppodio:output_file=${EICRECON_FILE} -Pjana:nevents=${NUMBER_OF_EVENTS} -Ppodio:output_include_collections="MCParticles,HcalEndcapNRawHits,HcalEndcapNRecHits,HcalEndcapNMergedHits,HcalEndcapNClusters,HcalEndcapNTruthClusters,EcalEndcapNRawHits,EcalEndcapNRecHits,EcalEndcapNClusters,EcalEndcapNClusterAssociations,EcalEndcapNTruthClusters,EcalEndcapNTruthClusterAssociations,CalorimeterTrackProjections,ReconstructedParticles"
#eicrecon $DDSIM_FILE -Ppodio:output_file=${EICRECON_FILE} -Pjana:nevents=${NUMBER_OF_EVENTS} -Ppodio:output_include_collections="MCParticles,HcalEndcapNRawHits,HcalEndcapNRecHits,HcalEndcapNMergedHits,HcalEndcapNClusters,HcalEndcapNTruthClusters,EcalEndcapNRawHits,EcalEndcapNRecHits,EcalEndcapNClusters,EcalEndcapNClusterAssociations,EcalEndcapNTruthClusters,EcalEndcapNTruthClusterAssociations"

exit

#EOF