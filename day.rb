class Day
  require 'time'

  attr_reader :time, :distance, :notes

  def initialize(params={})
    values = param_normalization(params)
    @time = values[:time]
    @distance = values[:distance]
    @notes = values[:notes]
  end

  def param_normalization(params)
    params[:time] ||= Time.now
    params[:time] = params[:time].utc
    unless params[:distance].is_a?(Numeric) or params[:distance] == 'NA'
      if params.has_key?(:notes)
        params[:notes] += " #{params[:distance]}"
      else
        params[:notes] = params[:distance]
      end
      params[:distance] = 0
    end
    return params
  end
end
