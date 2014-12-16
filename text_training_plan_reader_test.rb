require 'minitest/autorun'
require_relative 'text_training_plan_reader'

class TextTrainingPlanReaderTest < MiniTest::Test
  def test_initialize
    assert_raises(IOError) {TextTrainingPlanReader.new.read_file("non_existant_file_name.boo")}
    assert TextTrainingPlanReader.new.read_file('simple.txt')
  end

  def test_schedule_data
    x = TextTrainingPlanReader.new
    x.read_file('simple.txt')
    expected = [{name: 'Simple'}, {distance: '2'}, {distance: '2'},
                {distance: 'sprints'}, {distance: 'rest'}, {distance: 'gym'},
                {distance: '4'}, {distance: 'rest'}]
    assert_equal expected, x.schedule_data
  end
end

    
