require_relative 'schedule_formatter'
class TextScheduleFormatter < ScheduleFormatter
  def create_calendar
    cal = ''
    @days.each { |day| cal << format_event(day) }
    return cal
  end

  private
  TIME_FORMAT = '%m/%d/%Y'

  def format_event(day)
    return "Date:#{day.time.strftime(TIME_FORMAT)}\r\nSummary:Run #{day.distance} miles\r\nDescription:#{day.notes}"
  end
end
