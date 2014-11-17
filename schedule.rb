class Schedule
  attr_accessor :name, :days

  def initialize(params={})
    @name = params[:name] if params[:name]
    @days = params[:days] if params[:days]
  end

  def nil?
    @name.nil? || @days.nil?
  end
end
