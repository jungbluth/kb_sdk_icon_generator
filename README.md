# kb_sdk_icon_generator
kb_sdk_icon_generator is a small utility to generate icons for Apps - works with KBase SDK

## Requirements
* Docker

## Installation
* Download the Docker image: ```docker pull jungbluth/kb_sdk_icon_generator:latest```
* Alias the command: ```alias kb_sdk_icon_gen="docker run -v `pwd`:/tmp -it jungbluth/kb_sdk_icon_generator"```

## Overview
* Type ```kb_sdk_icon_gen``` and the utility will run in the current working directory. Importantly, Docker needs to be able to mount the local directory, so choose a location where Docker can operate (e.g. ~/Desktop).


## Demo
<p align="center">
  <img src="https://github.com/jungbluth/kb_sdk_icon_generator/blob/master/DEMO__kb_sdk_icon_generator.gif" width="800"/>
</p>