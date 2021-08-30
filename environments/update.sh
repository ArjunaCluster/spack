#/bin/bash
# Script to install /home/spack/environments/*
set -e

for ENV in $(find /home/spack/environments -maxdepth 1 -mindepth 1 -type d); do
    echo "updating $ENV"

    # Activate ENV
    spack env activate -d ${ENV}

    # Concretize
    echo "Concretize $ENV"
    time spack concretize --force

    # Fetch Dependencies
    echo "Fetching Dependencies for $ENV"
    time spack fetch --dependencies --missing

    # Install Spec
    echo "Installing $ENV"
    time srun \
        --ntasks 1 --ntasks-per-node 1 \
        --cpus-per-task 32 --mem-per-cpu 1G --time 2:00:00 \
        --nodelist=d001 \
        --account admin --partition admin \
        spack install --jobs 16 --verbose

    echo "Installed $ENV"
done

# Update Modules
spack module lmod refresh --delete-tree --yes-to-all
