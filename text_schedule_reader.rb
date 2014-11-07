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
  def read_data_file(input_file)
    if File::file?(input_file)
      input = File::open(input_file, 'r')
      @data = input.readlines
    else
      raise IOError, "File: #{input_file} was not found."
    end
  end
end
