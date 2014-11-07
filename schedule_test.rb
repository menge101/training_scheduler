require "minitest/autorun"
require './schedule'

class ScheduleTest < MiniTest::Test
  def test_initialize
    test_name = 'Initialize test'
    test_days = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    schedule = Schedule.new({name: test_name, days: test_days})
    assert schedule.name, test_name
    assert schedule.days, test_days
  end

  def test_nil?
    schedule = Schedule.new
    assert schedule.nil?
    schedule = Schedule.new({name: 'test'})
    assert schedule.nil?
    schedule = Schedule.new({days: %w(1 2)})
    assert schedule.nil?    
    schedule = Schedule.new({name: 'test', days: %w(1 2)})
    assert_equal schedule.nil?, false
  end
end
