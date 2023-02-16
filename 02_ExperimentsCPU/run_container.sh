#!/bin/bash
docker run -p 9000:9000 -v $(pwd)/app:/home/mluser/app -v $(pwd)/data:/home/mluser/data --rm --user $(id -u):$(id -g) mld02_cpu_experiment
