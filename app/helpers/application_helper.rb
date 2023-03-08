module ApplicationHelper
  def seconds_to_hh_mm_ss(seconds)
    hours = (seconds / (60 * 60)) % 60
    minutes = (seconds / 60) % 60

    format('%<hours>.2i:%<minutes>.2i:%<seconds>.2i', hours:, minutes:, seconds: seconds % 60)
  end
end
