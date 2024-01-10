require_relative '../data_constants'

class Theatre
  def print_seating_arrangement
    puts "Seating arrangement:"

    DataConstants::THEATRE_LAYOUT.each do |show_no, seat_layout|
      puts "Show #{show_no} Running in Audi #{show_no}:"
      puts "All Seats:"
      seat_layout.each do |type, type_seats|
        puts type_seats.join(' ')
      end
      puts "\n"
    end
  end
end
