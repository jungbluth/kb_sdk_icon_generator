# kb_sdk_icon_generator
utility to generate icons for Apps - work with KBase SDK

## Requirements
* Docker

## Installation
* Run ```docker pull jungbluth/kb_sdk_icon_generator:latest```
* Alias the command ```alias kb_sdk_icon_gen="docker run -v `pwd`:/tmp -it jungbluth/kb_sdk_icon_generator"```

## Overview
* Type ```kb_sdk_icon_gen``` and the program will run in the current directory. Important: docker needs to be able to mount the local directory, so choose a location where Docker can operate (e.g. ~/Desktop) 