#!/bin/bash

function buildDockerImage()
{
  cp -R "../src" .

  if [ ! -z "$HTTP_PROXY" ]; then
      docker build --build-arg HTTP_PROXY=$HTTP_PROXY -t ggp/ruby_mqtt_producer .
    else
      docker build -t ggp/ruby_mqtt_producer .
  fi
}
