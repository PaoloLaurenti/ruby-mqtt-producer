#!/bin/bash

function buildRubyMQTTInternalTemperaturesProducer()
{
  cp -R "../src" .

  if [ ! -z "$HTTP_PROXY" ]; then
      docker build --build-arg HTTP_PROXY=$HTTP_PROXY -t ggpltd/ruby_mqtt_internal_temperatures_producer .
    else
      docker build -t ggpltd/ruby_mqtt_internal_temperatures_producer .
  fi
}
