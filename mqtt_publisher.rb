require 'mqtt'

class MQTTPublisher

  def initialize(hostURI)
    @routing_key = "ruby_mqtt_producer"
    @client = MQTT::Client.connect(hostURI)
  end

  def publish
    @client.publish(@routing_key, 'message')
  end

  def terminate
    @client.disconnect
  end

end
