require 'bindata'

class RandomTemperatureMessageFactory

  def create
    temperature = TemperatureMQTTMessage.new
    temperature.msg_type = 2
    temperature.msg_value = 23
    temperature
  end

  private

    class TemperatureMQTTMessage < BinData::Record
      endian  :little

      uint8   :msg_type
      uint32  :msg_value
    end
end
