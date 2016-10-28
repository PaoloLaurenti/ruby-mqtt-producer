#!/usr/bin/env ruby
require 'mqtt'
require 'bindata'
require './temperature'

MQTT::Client.connect('mqtt://guest:guest@localhost:1883') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('ruby_mqtt_producer') do |topic,message|
    puts "#{topic}: #{message}"

    temperature = Temperature.new
    temperature.read(message)

    puts "#{temperature.msg_type} - #{temperature.msg_value}"
  end
end
