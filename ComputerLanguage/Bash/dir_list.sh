#!/bin/bash

for dir in $(ls -d ../*)
do 
    echo "dir : $dir"
    echo "full path : $(readlink -f $dir)"
done

docker create -it \
    -v /home/jayleekr/workspace/00_codes/00_branch/00_develop/feature/integration-demo/adar/docker/integration-test/cases/DEMO_INTEGRATION/ecu2:/ARA_ROOT \
    --volume /etc/timezone:/etc/timezone:ro \
    --security-opt seccomp=unconfined \
    --privileged \
    --name integrated-test-container-ecu2 integration-test-img

docker cp -r /home/jayleekr/workspace/00_codes/00_branch/00_develop/feature/integration-demo/adar/docker/ubuntu18.04/install integrated-test-container-ecu2:/adar/install/
docker cp /home/jayleekr/workspace/00_codes/00_branch/00_develop/feature/integration-demo/adar/projects/cmake/scripts/sdk-docker-install.sh integrated-test-container-ecu2:/adar/install/
docker cp /home/jayleekr/workspace/00_codes/00_branch/00_develop/feature/integration-demo/adar/projects/cmake/scripts/set-docker-env.sh integrated-test-container-ecu2:/adar/install/