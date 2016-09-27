#!/usr/bin/env ruby

require 'rubygems'
require 'thor'
require "./temperature_notifier"
require "./mqtt_publisher"

class Producer < Thor
  desc "produce", "start producing MQTT messages"
  method_option :uri,
                :default => "mqtt://guest:guest@localhost:1883",
                :desc => "URI of the MQTT host where to publish messages",
                :aliases => "-u"
  method_option :span,
                :type => :numeric,
                :default => 5,
                :desc => "waiting time in second between every MQTT publications",
                :aliases => "-s"
  method_option :count,
                :type => :numeric,
                :default => 1,
                :aliases => "-c",
                :desc => "number of concurrent prodcers to run"
  def produce
    mqtt_host_uri = options[:uri]
    publishers_count = options[:count]
    notifying_interval_in_secs = options[:span]

    temperature_notifiers = []

    publishers_count.times do
      mqtt_publisher = MQTTPublisher.new(mqtt_host_uri)
      tn = TemperatureNotifier.new(notifying_interval_in_secs, mqtt_publisher)
      tn.start_notify

      temperature_notifiers << tn
    end

    puts("====================================")
    puts("")
    puts("Press [enter] to exit...")
    puts("")
    puts("====================================")

    names = STDIN.gets

    temperature_notifiers.each do |tn|
      tn.stop_notify()
    end
  end
end

Producer.start
