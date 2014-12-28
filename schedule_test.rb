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

  def test_extract_name_from_data
    data = [{name:'test'},{distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    assert_equal nil, x.name
    x.extract_name_from_data
    assert_equal 'test', x.name
    assert_equal 3, data.size

    data = [{name:'test',distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    assert_equal nil, x.name
    x.extract_name_from_data
    assert_equal 'test', x.name
    assert_equal 2, data.size

    data = [{distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    assert_equal nil, x.name
    x.extract_name_from_data
    assert_equal nil, x.name
    assert_equal 2, data.size
  end

  def test_sanitize_data
    data = [{distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    x.sanitize_data
    assert_equal data, x.data

    data = [{name: 'test',distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    x.sanitize_data
    assert_equal data, x.data

    data = [{name: 'test'},{distance:1, offset:0},{distance:2, offset:1}]
    expectation = [{distance:1, offset:0},{distance:2, offset:1}]
    x = Schedule.new({data:data})
    x.sanitize_data
    assert_equal expectation, x.data
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
    x = Schedule.new({data: arguments})
    assert_equal expectation, x.process_data
  end

  def test_format_days

  end

  def test_persist_schedule

  end
end
