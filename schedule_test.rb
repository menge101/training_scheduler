require 'minitest/autorun'
require_relative 'schedule'
require_relative 'day'
require_relative 'scheduleable_double'

class ScheduleTest < MiniTest::Test
  def test_initialize
    test_name = 'Initialize test'
    test_days = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    schedule = Schedule.new({name: test_name, days: test_days})
    assert schedule.name, test_name
  end

  def test_build_schedule

  end

  def test_read_training_plan
    reader = MiniTest::Mock.new
    reader.expect(:read_file, true)
    reader.expect(:schedule_data, [ScheduleableDouble.new])
    x = Schedule.new({reader: reader})
    assert_equal(ScheduleableDouble.new, x.read_training_plan.first)
    reader.verify
  end

  def test_process_data
    arguments = [{distance:1, offset:0},{distance:2, offset:1}]
    expectation = [Day.new({distance:1, offset:0}), Day.new({distance:2, offset:1})]
    x = Schedule.new
    assert_equal expectation, x.process_data(arguments)
  end

  def test_format_days

  end

  def test_persist_schedule

  end
end
