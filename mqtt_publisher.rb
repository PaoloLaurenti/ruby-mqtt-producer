require 'mqtt'

class MQTTPublisher

  def initialize
    @client = MQTT::Client.connect('mqtt://guest:guest@localhost:1883')
  end

  def publish
    @client.publish('test', 'message')
  end

  def terminate
    @client.disconnect
  end

end
