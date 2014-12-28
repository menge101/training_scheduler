require 'time'

class Day
  VALID_PARAMS = [:time, :distance, :notes].freeze
  DEFAULTS = {start_time: Time.new(Time.now.year, Time.now.month, Time.now.day, 8, 0, 0, "-04:00") }.freeze

  VALID_PARAMS.each { |param| attr_reader param.to_sym }

  def initialize(params={})
    values = param_normalization(params)
    values.each { |key, value| self.instance_variable_set("@#{key}".to_sym, value) if VALID_PARAMS.include?(key) }
  end

  def param_normalization(params)
    params[:offset] ||= 0
    params[:time] ||= DEFAULTS[:start_time] + (params[:offset] * 24 * 60 * 60)
    params[:time] = params[:time].utc
    unless params[:distance].is_a?(Numeric) or params[:distance] == 'NA'
      if params.has_key?(:notes)
        params[:notes] += " #{params[:distance]}"
      else
        params[:notes] = params[:distance]
      end
      params[:distance] = 0
    end
    params
  end

  def ==(other)
    flag = true
    VALID_PARAMS.each do |param|
      flag = flag && self.send(param) == other.send(param)
    end
    flag && self.class == other.class
  end
end
