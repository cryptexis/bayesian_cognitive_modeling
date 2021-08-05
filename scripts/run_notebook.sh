#!/bin/bash
docker run --gpus all --rm --name proba -d -it -p 8888:8888 -v $(pwd):/root/work -e GRANT_SUDO=yes --user root cryptexis/proba-jupyter-gpu
