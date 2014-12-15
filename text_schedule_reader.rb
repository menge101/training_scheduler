require './schedule_reader'

class TextScheduleReader < ScheduleReader
  def schedule_data
    return_array = [{name: @data.slice!(0).to_s.chomp}]
    @data.each do |x|
      return_array << {distance: x.to_s.chomp}
    end
    return return_array
  end

  private
  def read_data_file(input)
      @data = input.readlines
  end
end
