require 'bindata'

class RandomTemperatureMessageFactory

  def initialize(seller_id)
    @seller_id = seller_id
    @random_number_generator = Random.new
  end

  def create
    temperature = TemperatureMQTTMessage.new
    temperature.seller_id = @seller_id
    temperature.msg_type = 2
    temperature.timestamp = Time.now.to_i
    temperature.msg_value = @random_number_generator.rand(-15..40)
    temperature
  end

  private

    class TemperatureMQTTMessage < BinData::Record
      endian  :big

      uint16  :seller_id
      uint8   :msg_type
      uint32  :timestamp
      uint32  :msg_value
    end
end
