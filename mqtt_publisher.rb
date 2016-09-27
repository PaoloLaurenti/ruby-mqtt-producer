require 'mqtt'

class MQTTPublisher

  def initialize(hostURI)
    @client = MQTT::Client.connect(hostURI)
  end

  def publish
    @client.publish('test', 'message')
  end

  def terminate
    @client.disconnect
  end

end
