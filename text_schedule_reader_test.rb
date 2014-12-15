require 'minitest/autorun'
require './text_schedule_reader'

class TextScheduleReaderTest < MiniTest::Test
  def test_initialize
    assert_raises(IOError) {TextScheduleReader.new.read_training_plan("non_existant_file_name.boo")}
    assert TextScheduleReader.new.read_training_plan('simple.txt')
  end

  def test_schedule_data
    x = TextScheduleReader.new
    x.read_training_plan('simple.txt')
    expected = [{name: 'Simple'}, {distance: '2'}, {distance: '2'},
                {distance: 'sprints'}, {distance: 'rest'}, {distance: 'gym'},
                {distance: '4'}, {distance: 'rest'}]
    assert_equal expected, x.schedule_data
  end
end

    
