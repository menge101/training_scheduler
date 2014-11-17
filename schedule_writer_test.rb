require 'minitest/autorun'
require './schedule_writer'
require './scheduleable_double'

class ScheduleWriterTest < MiniTest::Test
  def test_create_calender
    assert_raises(NotImplementedError) {ScheduleWriter.new([ScheduleableDouble.new],nil).create_calendar}
  end

  def test_persist_content
    observer = MiniTest::Mock.new
    x = ScheduleWriter.new([ScheduleableDouble.new],observer)
    observer.expect(:persist, true, ['test_string'])
    observer.expect(:close, true)
    assert x.persist_content('test_string')
    observer.verify

    observer = MiniTest::Mock.new
    x = ScheduleWriter.new([ScheduleableDouble.new],observer)
    observer.expect(:persist, false, ['test_string'])
    observer.expect(:close, true)
    x.persist_content('test_string')
    observer.verify
  end
end
