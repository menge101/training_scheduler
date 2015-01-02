class ScheduleFormatter
  def initialize(days)
    @days = days
  end

  def create_calendar
    raise NotImplementedError, "The method 'create_calendar' has not yet been implemented"
  end
end
