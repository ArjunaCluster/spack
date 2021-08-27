#/bin/bash

SPACK=/home/spack/spack/bin/spack
export SPACK

read -r -d '' SCRIPT << EOM
#SBATCH nodes=1
#SBATCH mem=32G
#SBACTH cpu=16
#SBATCH time=1-0
$SPACK env activate -d \${ENV}
$SPACK concretize -f
$SPACK install -j 16
EOM


for ENV in $(find /home/spack/environments -maxdepth 1 -mindepth 1 -type d); do
    export ENV
    echo "$SCRIPT" | envsubst '${ENV}'
done
