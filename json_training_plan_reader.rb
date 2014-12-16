require 'json'
require_relative 'training_plan_reader'

class JsonTrainingPlanReader < TrainingPlanReader
  def schedule_data
    return_array = [{name: @data['name']}]
    @data['days'].each do |x|
      return_array << {distance: x.to_s}
    end
    return_array
  end

  private
  def read_data_file(input)
    JSON.parse(input.read).first 
  end
end
