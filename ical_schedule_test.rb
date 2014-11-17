require 'minitest/autorun'
require './scheduleable_double'
require './ical_schedule'


class IcalScheduleTest < MiniTest::Test
  def test_initialize
    x = IcalSchedule.new([ScheduleableDouble.new],nil)
    assert x
  end

  def test_create_calendar
    x = IcalSchedule.new([ScheduleableDouble.new],nil)
    expected = "DTSTART;VALUE=DATE:20141116\r\nDTEND;VALUE=DATE:20141116"
    assert_includes x.create_calendar.chomp, expected
    expected = 'DESCRIPTION:This is a note'
    assert_includes x.create_calendar.chomp, expected
    expected = 'SUMMARY:Run 2 miles'
    assert_includes x.create_calendar.chomp, expected
  end    
end
