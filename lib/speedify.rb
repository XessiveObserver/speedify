class Speedify
  # Convert speed from km/h to m/s
  def self.speed_to_mps(speed_kmh)
    (speed_kmh * 1000.0) / 3600.0
  end

  # Convert speed from m/s to km/h
  def self.speed_to_kmh(speed_mps)
    (speed_mps * 3600.0) / 1000.0
  end

  #Calculate time given distance (in km) and speed(in km/h)
  def self.time_for_distance(distance_km, speed_kmh)
    raise ArgumentError, "Speed must be greater than zero(0)" if speed_kmh <= 0

    time_hours = distance_km / speed_kmh
    convert_hours_to_time_format(time_hours)
  end

  # Calculate distance given speed time (in km/h) and time (in hours)
  def self.distance_for_time(time_hours, speed_kmh)
    raise ArgumentError, "Speed must be greater than zero(0)" if speed_kmh <= 0

    time_hours * speed_kmh
  end

  # Calculate speed given distance (in km) and time (in hours)
  def self.speed_for_distance_and_time(distance_km, time_hours)
    raise ArgumentError, "Time must be greater than Zero(0)" if time_hours <= 0

    distance_km / time_hours
  end

  private

  # Convert fractional hours to time
  def self.convert_hours_to_time_format(hours)
    total_seconds = (hours * 3600).to_i
    hh = total_seconds / 3600
    mm = (total_seconds % 3600) / 60
    ss = total_seconds % 60
    
    format("%02d:%02d:%02d", hh, mm, ss)
  end
end
