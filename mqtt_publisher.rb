require 'mqtt'
require 'bindata'

class MQTTPublisher

  def initialize(hostURI)
    @routing_key = "ruby_mqtt_producer"
    @client = MQTT::Client.connect(hostURI)
  end

  def publish
    temperature = TemperatureMQTTMessage.new
    temperature.msg_type = 1
    temperature.msg_value = 23
    @client.publish(@routing_key, temperature.to_binary_s, false, 1)
  end

  def terminate
    @client.disconnect
  end

  private

    class TemperatureMQTTMessage < BinData::Record
      endian  :little

      uint8   :msg_type
      uint32  :msg_value
    end

end
