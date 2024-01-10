require_relative '../data_constants'

class Seats
  attr_accessor :available_seats
  
  def initialize(available_seats)
    @available_seats = available_seats
  end

  def display_available_seats
    puts "Available Seats:"
    @available_seats.each do |row, seats|
      row_seats = seats.join(", ")
      puts row_seats
    end
  end

  def get_seats_to_book(seats_entered)
    seats = {}

    @available_seats.each do |row, row_seats|
      selected_seats = seats_entered.select { |seat| row_seats.include?(seat) }
      unless selected_seats.empty?
        seats[row] = selected_seats
        seats_entered -= selected_seats
      end
    end
      
    unless seats_entered.empty?
      puts "#{seats_entered.join(", ")} Not available, Please select different seats"
      seats = {}
    end
      
    seats
  end
end
