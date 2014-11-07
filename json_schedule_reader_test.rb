require 'minitest/autorun'
require './json_schedule_reader'
require 'json'

class JsonScheduleReaderTest < MiniTest::Test
  def test_read_schedule
    assert_raises(IOError) {JsonScheduleReader.new.read_schedule('non_existant_file_name.boo')}
    assert JsonScheduleReader.new.read_schedule('simple.json')
  end
  
  def test_schedule_data
    x = JsonScheduleReader.new
    x.read_schedule('simple.json')
    expected = [{name: 'Simple'}, {distance: '2'}, {distance: '2'},
                {distance: 'sprints'}, {distance: 'rest'}, {distance: 'gym'},
                {distance: '4'}, {distance: 'rest'}]
    assert_equal expected, x.schedule_data
  end
end
    
  
