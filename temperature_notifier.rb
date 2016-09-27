class TemperatureNotifier
  @inner_thread

  def initialize(notifying_interval_in_secs, publisher)
    @notifying_enabled = false
    @notifying_interval_in_secs = notifying_interval_in_secs
    @publisher = publisher
  end

  def start_notify
    @notifying_enabled = true

    @inner_thread = Thread.new do
      while @notifying_enabled do
        puts "notify"
        @publisher.publish
        sleep(@notifying_interval_in_secs)
      end
    end
  end

  def stop_notify
    @notifying_enabled = false
    @inner_thread.join
  end

end
