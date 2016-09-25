require 'rubygems'
require 'mqtt'

# Publish example
MQTT::Client.connect('mqtt://guest:guest@localhost:1883') do |c|
  c.publish('test', 'message')
end


# require 'rubygems'
# require 'em/mqtt'
#
# # Publish example
# EventMachine.run do
#   c = EventMachine::MQTT::ClientConnection.connect('mqtt://guest:guest@localhost:1883')
#   EventMachine::PeriodicTimer.new(1.0) do
#     puts "-- Publishing time"
#     c.publish('test', "The time is #{Time.now}")
#   end
# end
