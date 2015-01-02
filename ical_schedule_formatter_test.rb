require 'minitest/autorun'
require_relative 'scheduleable_double'
require_relative 'ical_schedule_formatter'


class IcalScheduleFormatterTest < MiniTest::Test
  def test_initialize
    x = IcalScheduleFormatter.new([ScheduleableDouble.new],nil)
    assert x
  end

  def test_create_calendar
    x = IcalScheduleFormatter.new([ScheduleableDouble.new])
    expected = "DTSTART;VALUE=DATE:20141116\r\nDTEND;VALUE=DATE:20141116"
    assert_includes x.create_calendar.chomp, expected
    expected = 'DESCRIPTION:This is a note'
    assert_includes x.create_calendar.chomp, expected
    expected = 'SUMMARY:Run 2 miles'
    assert_includes x.create_calendar.chomp, expected
  end    
end
