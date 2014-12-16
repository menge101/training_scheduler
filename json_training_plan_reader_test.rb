require 'minitest/autorun'
require './json_training_plan_reader'
require 'json'

class JsonTrainingPlanReaderTest < MiniTest::Test
  def test_read_schedule
    assert_raises(IOError) {JsonTrainingPlanReader.new.read_file('non_existant_file_name.boo')}
    assert JsonTrainingPlanReader.new.read_file('simple.json')
  end
  
  def test_schedule_data
    x = JsonTrainingPlanReader.new
    x.read_file('simple.json')
    expected = [{name: 'Simple'}, {distance: '2'}, {distance: '2'},
                {distance: 'sprints'}, {distance: 'rest'}, {distance: 'gym'},
                {distance: '4'}, {distance: 'rest'}]
    assert_equal expected, x.schedule_data
  end
end
    
  
