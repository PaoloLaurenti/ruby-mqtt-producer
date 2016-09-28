require 'mqtt'
require 'bindata'
require './temperature'

class MQTTPublisher

  def initialize(hostURI)
    @routing_key = "ruby_mqtt_producer"
    @client = MQTT::Client.connect(hostURI)
  end

  def publish
    temperature = Temperature.new
    temperature.msg_type = 1
    temperature.msg_value = 23
    puts temperature.to_binary_s
    @client.publish(@routing_key, temperature.to_binary_s, false, 1)
  end

  def terminate
    @client.disconnect
  end

end
