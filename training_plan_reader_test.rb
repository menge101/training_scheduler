require 'minitest/autorun'
require_relative 'training_plan_reader'

class TrainingPlanReaderTest < MiniTest::Test
  def test_read_schedule
    assert_raises(IOError) {TrainingPlanReader.new.read_training_plan('non_existant_file_name.boo')}
    assert_raises(NotImplementedError) {TrainingPlanReader.new.read_training_plan('simple.json')}
  end
  
  def test_schedule_data
    assert_raises(NotImplementedError) {TrainingPlanReader.new.schedule_data}
  end
end
    
  
