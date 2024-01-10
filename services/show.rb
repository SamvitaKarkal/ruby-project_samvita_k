require_relative '../data_constants'

class Show
  def initialize
    @show_number = 0
    @seats_booked = {}
  end

  def set_show_number(show_number)
    @show_number = show_number
  end

  def calculate_available_show_seats
    available_seats = {}
    show_layout = DataConstants::THEATRE_LAYOUT[@show_number]
  
    if @seats_booked.empty? || @seats_booked[@show_number].nil?
      available_seats = show_layout
    else
      show_layout.each do |row, seats|
        available_seats[row] = seats.reject { |seat|
          unless @seats_booked[@show_number][row].nil?
            @seats_booked[@show_number][row].include?(seat)
          end
        }
      end
    end

    available_seats
  end

  def update_booked_seats(seats_with_row)
    if @seats_booked[@show_number].nil?
      @seats_booked[@show_number] = seats_with_row
    else
      seats_with_row.each do |row, new_seats|
        if @seats_booked[@show_number][row].nil?
          @seats_booked[@show_number][row] = new_seats
        else
          @seats_booked[@show_number][row] += new_seats
        end
      end
    end
  end
end
