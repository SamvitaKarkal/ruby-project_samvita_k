require_relative '../data_constants'

class SalesCalculator
  attr_accessor :revenue, :total_service_charge, :total_sb_cess, :total_kk_cess

  def initialize
    @revenue = 0
    @total_service_charge = 0
    @total_sb_cess = 0
    @total_kk_cess = 0
  end

  def calculate_charges_per_booking(show_number, sub_total)
    @revenue += sub_total
    
    service_tax = trim_decimal_after_two_values(DataConstants::TAX_RATES['service_tax'] * sub_total)
    @total_service_charge += service_tax

    sb_cess = trim_decimal_after_two_values(DataConstants::TAX_RATES['swatch_bharat_cess'] * sub_total)
    @total_sb_cess += sb_cess

    kk_cess = trim_decimal_after_two_values(DataConstants::TAX_RATES['krishi_kalyan_cess'] * sub_total)
    @total_kk_cess += kk_cess

    puts "Print: Successfully Booked - Show #{show_number}"
    display_booking_calculation(sub_total, service_tax, sb_cess, kk_cess)
  end

  def display_final_calculation
    puts "Total Sales:"
    puts "Revenue: #{trim_decimal_after_two_values(@revenue)}"
    puts "Service Tax: #{trim_decimal_after_two_values(@total_service_charge)}"
    puts "Swachh Bharat Cess: #{trim_decimal_after_two_values(@total_sb_cess)}"
    puts "Krishi Kalyan Cess: #{trim_decimal_after_two_values(@total_kk_cess)}"
  end

  private

  def display_booking_calculation(sub_total, service_tax, sb_cess, kk_cess)
    puts "Subtotal: Rs. #{sub_total}"
    puts "Service Tax @14%: Rs. #{service_tax}"
    puts "Swachh Bharat Cess @0.5%: Rs. #{sb_cess}"
    puts "Krishi Kalyan Cess @0.5%: Rs. #{kk_cess}"
    puts "Total: Rs. #{sub_total + service_tax + sb_cess + kk_cess}"
  end

  def trim_decimal_after_two_values(value)
    ('%.2f' % value).to_f
  end
end
