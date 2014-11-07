require 'json'
require './schedule_reader'

class JsonScheduleReader < ScheduleReader
  def schedule_data
    return_array = [{name: @data['name']}]
    @data['days'].each do |x|
      return_array << {distance: x.to_s}
    end
    return return_array
  end

  private
  def read_data_file(input)
    JSON.parse(input.read).first 
  end
end
