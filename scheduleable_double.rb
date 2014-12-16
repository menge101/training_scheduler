require 'time'

class ScheduleableDouble
  def time
    Time.new(2014, 11, 16)
  end

  def distance
    2
  end

  def notes
    'This is a note'
  end

  def ==(other)
    self.time == other.time && self.distance == other.distance && self.notes == other.notes
  end
end
