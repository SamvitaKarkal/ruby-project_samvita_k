require_relative '../data_constants'

class Customer
  def select_show_number
    puts "Input: \n Enter Show no: "
    show_number = gets.chomp.to_i

    if [1, 2, 3].include?(show_number)
      show_number
    else
      puts "The Show number is invalid. Please try again"
      # nil
    end
  end

  def select_required_seats
    puts "Enter seats: "
    input_seats = gets.chomp.split(', ').map(&:strip)

    if input_seats.empty?
      puts "No seats entered. Please try again!"
    end

    input_seats
  end

  def select_proceed_option
    puts "Would you like to continue (Yes/No):"
    proceed = gets.chomp.downcase
    puts "\n"

    if proceed == 'yes' || proceed == 'y'
      return true
    elsif proceed == 'no' || proceed == 'n'
      return false
    else
      puts "Invalid option. Please try again!"
      select_proceed_option
    end
  end
end
