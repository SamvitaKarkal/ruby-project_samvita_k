require_relative '../data_constants'
require 'byebug'

class ProcessBookings
  attr_accessor :seats_with_row

  def initialize(seats_with_row)
    @seats_with_row = seats_with_row
  end

  def calculate_booking_cost
    sub_total = 0

    @seats_with_row.each do |row, seats|
      sub_total += DataConstants::TICKET_RATES[row] * seats.count
    end

    sub_total
  end
end
