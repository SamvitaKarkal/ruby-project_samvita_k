require_relative 'movie_booking_system'

class Main
  def initialize
    @booking_system = MovieBookingSystem.instance
    @booking_system1 = MovieBookingSystem.instance
  end

  def start
    puts @booking_system.object_id
    puts @booking_system1.object_id
    
    @booking_system.run
  end
end

Main.new.start
