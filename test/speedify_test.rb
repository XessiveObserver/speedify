require 'minitest/autorun'
require_relative '../lib/speedify'

class SpeedifyTest < Minitest::Test
  def test_speed_to_mps
    assert_in_delta 2.77778, Speedify.speed_to_mps(10), 0.00001
  end

  def test_speed_to_kmh
    assert_in_delta 10, Speedify.speed_to_kmh(2.77778), 0.00001
  end

  def test_time_for_distance
    assert_equal "04:13:10", Speedify.time_for_distance(42.195, 10)
    assert_raises(ArgumentError) { Speedify.time_for_distance(42.195, 0) }
  end

  def test_distance_for_time
    assert_in_delta 20.0, Speedify.distance_for_time(2, 10), 0.00001
    assert_raises(ArgumentError) { Speedify.distance_for_time(2, 0) }
  end

  def test_speed_for_distance_and_time
    assert_in_delta 10.0, Speedify.speed_for_distance_and_time(42.195, 4.2195), 0.0001
    assert_raises(ArgumentError) { Speedify.speed_for_distance_and_time(42.195, 0) }
  end
end
