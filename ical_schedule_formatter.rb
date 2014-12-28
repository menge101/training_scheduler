require 'icalendar'
require_relative 'schedule_formatter'

class IcalScheduleFormatter < ScheduleFormatter
  def create_calendar
    cal = Icalendar::Calendar.new
    @days.each { |day| format_event(day, cal) }
    cal.to_ical
  end

  private
  def format_event(day, cal)
    cal.event do |event|
      event.dtstart     = Icalendar::Values::Date.new(day.time)
      event.dtend       = Icalendar::Values::Date.new(day.time)
      event.summary     = "Run #{day.distance} miles"
      event.description = day.notes
    end
  end
end
