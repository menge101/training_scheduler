require 'minitest/autorun'
require './scheduleable_double'
require './text_schedule_writer'

class TextScheduleWriterTest < MiniTest::Test
  def test_create_calendar
    x = TextScheduleWriter.new([ScheduleableDouble.new], nil)
    expected = 'Summary:Run 2 miles'
    assert_includes x.create_calendar, expected
    expected = 'Description:This is a note'
    assert_includes x.create_calendar, expected
    expected = 'Date:11/16/2014'
    assert_includes x.create_calendar, expected
  end
end
