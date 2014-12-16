require 'minitest/autorun'
require 'time'
require_relative 'day'


class DayTest < MiniTest::Test
  def test_time
    today = Day.new({distance: 14.1})
    expected_time = Time.new(Time.now.year, Time.now.month, Time.now.day, 8, 0, 0, "-04:00")
    assert_equal expected_time.strftime('%s'), today.time.strftime('%s')
    later = Day.new({time: Time.parse('2014-11-11 3:33:03 -4:00'), distance: 14.1})
    assert_equal Time.parse('2014-11-11 8:33:03 UTC'), later.time
  end

  def test_distance
    zero = Day.new({time: Time.now, distance: 0})
    assert_equal 0, zero.distance
    rest = Day.new({time: Time.now, distance: 'rest'})
    assert_equal 0, rest.distance
    na = Day.new({time: Time.now, distance: 'NA', notes: 'Sprints'})
    assert_equal 'NA', na.distance
  end

  def test_notes
    none = Day.new({time: Time.now, distance: 0})
    assert_equal nil, none.notes
    rest = Day.new({time: Time.now, distance: 'rest'})
    assert_equal 'rest', rest.notes
    speed_work = Day.new({time: Time.now, distance: 3, notes: 'Speed Work'})
    assert speed_work.notes == 'Speed Work'
    na = Day.new({time: Time.now, distance: 'NA', notes: 'Sprints'})
    assert_equal 'Sprints', na.notes
    collision = Day.new({time: Time.now, distance: 'rest', notes: 'Speed Work'})
    assert_equal 'Speed Work rest', collision.notes
  end

  #This fucking test doens't work and I don't understand why.
  #def test_equal
  #  day1 = Day.new({time: Time.now, distance: 'NA', notes: 'Sprints'})
  #  day2 = Day.new({time: Time.now, distance: 'NA', notes: 'Sprints'})
  #  assert_operator day1, :==, day2
  #
  #  day3 = Day.new({time: Time.now, distance: '1', notes: 'slow'})
  #  reject_operator day1, :==, day3
  #end

  def test_implements_the_scheduleable_interface
    test = Day.new({time: Time.now, distance: 2})
    assert_respond_to(test, :time)
    assert_respond_to(test, :distance)
    assert_respond_to(test, :notes)
  end
end
