# kb_sdk_icon_generator
utility to generate icons for Apps - work with KBase SDK

## Requirements
* Docker

## Installation
* Download the Docker image: ```docker pull jungbluth/kb_sdk_icon_generator:latest```
* Alias the command: ```alias kb_sdk_icon_gen="docker run -v `pwd`:/tmp -it jungbluth/kb_sdk_icon_generator"```

## Overview
* Type ```kb_sdk_icon_gen``` and the utility will run in the current working directory. Importantly, Docker needs to be able to mount the local directory, so choose a location where Docker can operate (e.g. ~/Desktop).

[![kb_sdk_icon_gen](http://img.youtube.com/vi/KOxbO0EI4MA/0.jpg)](https://github.com/jungbluth/kb_sdk_icon_generator/blob/master/vid/DEMO__kb_sdk_app_icon_generator.mp4 "kb_sdk_icon_gen")