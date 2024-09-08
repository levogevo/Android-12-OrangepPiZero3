#!/bin/bash

docker run --rm -it -v "$(pwd)":/workdir -w /workdir android_12_opi_zero3_docker
