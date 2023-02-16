#!/bin/bash
docker build --build-arg USERID=$(id -u) -t mld02_cpu_experiment .
