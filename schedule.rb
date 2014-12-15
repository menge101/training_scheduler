require_relative 'day'
class Schedule
  VALID_PARAMS = [:reader, :formatter, :writer, :name].freeze

  VALID_PARAMS.each { |param| attr_accessor param.to_sym}

  def initialize(params={})
    params.each { |key, value| self.instance_variable_set("@#{key}".to_sym, value) if VALID_PARAMS.include?(key) }
  end

  def build_schedule
    data = read_training_plan
    @name = data[:name]
    days = process_data(data)
    schedule = format_days(days)
    persist_schedule(schedule)
  end

  def read_training_plan
    if @reader
      @reader.schedule_data
    else
      raise RunTimeError, 'Reader not initialized.'
    end
  end

  def process_data(data)
    days = []
    data.each_with_index { |entry,idx | days << Day.new(entry.merge(offest: idx)) }
  end

end
