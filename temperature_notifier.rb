class TemperatureNotifier
  @inner_thread

  def initialize
    @notifying_enabled = false
  end

  def start_notify
    @notifying_enabled = true

    @inner_thread = Thread.new do
      while @notifying_enabled do
        puts "notify"
        sleep(3)
      end
    end
  end

  def stop_notify
    @notifying_enabled = false
    @inner_thread.join
  end

end
