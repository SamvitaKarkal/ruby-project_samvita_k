require_relative 'services/theatre'
require_relative 'services/seats'
require_relative 'services/show'
require_relative 'services/process_bookings'
require_relative 'services/customer'
require_relative 'services/sales_calculator'
require 'singleton'

class MovieBookingSystem
  include Singleton
  
  def initialize
  end
  
  def run
    theatre = Theatre.new
    sales_calculator = SalesCalculator.new
    show = Show.new
    theatre.print_seating_arrangement

    loop do
      customer = Customer.new
      show_number = customer.select_show_number

      unless show_number.nil?
        show.set_show_number(show_number)
        available_seats = show.calculate_available_show_seats

        seats = Seats.new(available_seats)
        seats.display_available_seats
        seats_entered = customer.select_required_seats
        seats_with_row = seats.get_seats_to_book(seats_entered) unless seats_entered.empty?

        unless seats_with_row.empty?
          bookings = ProcessBookings.new(seats_with_row)
          sub_total = bookings.calculate_booking_cost
          sales_calculator.calculate_charges_per_booking(show_number, sub_total)

          show.update_booked_seats(seats_with_row)
        end
      end

      unless customer.select_proceed_option
        sales_calculator.display_final_calculation
        break
      end
    end
  end
end
