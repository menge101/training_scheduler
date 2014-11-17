class FileWriter
  def initialize(file_object)
    begin
      @output = file_object 
      #File.open(filename, File::WRONLY|File::CREAT|File::EXCL)
    rescue => e
      puts e.message
      puts e.backtrace
    end
  end

  def persist(string_content)
    begin
      @output.print(string_content)
    rescue => e
      puts e.message
      puts e.backtrace
      false
    else
      true
    end
  end

  def close
    @output.close
    @output.closed?
  end
end
