module ApplicationHelper
  def seconds_to_time(seconds)
    hours = (seconds / 3600).to_i
    minutes = ((seconds / 60) % 60).to_i
    seconds = (seconds % 60).to_f

    format('%<hours>.2i:%<minutes>.2i:%<seconds>06.3f', hours:, minutes:, seconds:)
  end
end
