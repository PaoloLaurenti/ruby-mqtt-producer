require 'bindata'

class RandomTemperatureMessageFactory

  def initialize
    @random_number_generator = Random.new
  end

  def create
    temperature = TemperatureMQTTMessage.new
    temperature.msg_type = 2
    temperature.msg_value = @random_number_generator.rand(-15..40)
    temperature
  end

  private

    class TemperatureMQTTMessage < BinData::Record
      endian  :big

      uint8   :msg_type
      uint32  :msg_value
    end
end
