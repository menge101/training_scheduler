require 'minitest/autorun'
require_relative 'schedule_formatter'
require_relative 'scheduleable_double'

class ScheduleFormatterTest < MiniTest::Test
  def test_create_calender
    assert_raises(NotImplementedError) {ScheduleFormatter.new([ScheduleableDouble.new]).create_calendar}
  end
end
