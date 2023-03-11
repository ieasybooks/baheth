module TimeUtilities
  ##
  # Converts a floating point number of seconds into a formatted time string in the format "HH:MM:SS.sss".
  #
  # @param seconds [Float] the number of seconds to be converted into a formatted time string.
  # @return [String] A formatted time string in the format "HH:MM:SS.sss".
  #
  # @example
  #   seconds_to_time(3661.4) #=> "01:01:01.400"
  def seconds_to_time(seconds)
    hours = (seconds / 3600).to_i
    minutes = ((seconds / 60) % 60).to_i
    seconds = (seconds % 60).to_f

    format('%<hours>.2i:%<minutes>.2i:%<seconds>06.3f', hours:, minutes:, seconds:)
  end

  ##
  # Converts a time string in the format "HH:MM:SS.sss" to the corresponding floating point number of seconds.
  #
  # @param time [String] a time string in the format "HH:MM:SS.sss".
  # @return [Float] The number of seconds equivalent to the input time string.
  #
  # @example
  #   time_to_seconds("01:01:01.400") #=> 3661.4
  def time_to_seconds(time)
    hours, minutes, seconds = time.split(':').map(&:to_f)
    (hours * 3600) + (minutes * 60) + seconds
  end
end
