class ScheduleReader
  def read_schedule(file_name)
    if File::file?(file_name)
      input = File::open(file_name, "r")
      @data = read_data_file(input)
      input.close
      true
    else
      raise IOError, "File: #{file_name} was not found." 
    end
  end

  def schedule_data
    raise NotImplementedError, "The method 'schedule_data' has not yet been implemented"
  end

  private
  def read_data_file(input_file)
    raise NotImplementedError, "The method 'read_data_file' has not yet been implemented"
  end
end
