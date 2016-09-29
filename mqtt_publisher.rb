require 'mqtt'

class MQTTPublisher

  def initialize(hostURI)
    @routing_key = "devices"
    @client = MQTT::Client.connect(hostURI)
  end

  def publish(message)
    @client.publish(@routing_key, message.to_binary_s, false, 1)
  end

  def terminate
    @client.disconnect
  end

end
