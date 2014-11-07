require "minitest/autorun"
require "./schedule_reader"

class ScheduleReaderTest < MiniTest::Test
  def test_read_schedule
    assert_raises(IOError) {ScheduleReader.new.read_schedule('non_existant_file_name.boo')}
    assert_raises(NotImplementedError) {ScheduleReader.new.read_schedule('simple.json')}
  end
  
  def test_schedule_data
    assert_raises(NotImplementedError) {ScheduleReader.new.schedule_data}
  end
end
    
  
