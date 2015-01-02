require_relative 'day'
class Schedule
  VALID_PARAMS = [:reader, :formatter, :writer, :name, :data].freeze

  VALID_PARAMS.each { |param| attr_accessor param.to_sym}

  def initialize(params={})
    params.each { |key, value| self.instance_variable_set("@#{key}".to_sym, value) if VALID_PARAMS.include?(key) }
  end

  def build_schedule
    @data = read_training_plan
    extract_name_from_data
    sanitize_data
    @days = process_data
    @schedule = format_days
    persist_schedule
  end

  def read_training_plan
    if @reader.read_file
      @reader.schedule_data
    else
      raise RunTimeError, 'Reader not initialized.'
    end
  end

  # Schedule name should be in the first element of the data array
  def extract_name_from_data
    @name = @data.first[:name] if @data.first.has_key?(:name)
  end

  # No data entry should be kept if it does not have at least a distance or a time
  def sanitize_data
    @data.delete_if {|data_entry| !data_entry.has_key?(:time) && !data_entry.has_key?(:distance) }
  end

  def process_data
    days = []
    @data.each_with_index { |entry,idx | days << Day.new(entry.merge(offset: idx)) }
    days
  end

  def format_days

  end

end
