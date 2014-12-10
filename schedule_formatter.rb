class ScheduleFormatter
  def initialize(days, data_persistor)
    @days = days
    @persistor = data_persistor
  end

  def create_calendar
    raise NotImplementedError, "The method 'create_calendar' has not yet been implemented"
  end

  def persist_content(content)
    begin
      @persistor.persist(content)
    rescue => e
      puts e.message
      puts e.backtrace
    ensure
      @persistor.close
    end
  end
end
