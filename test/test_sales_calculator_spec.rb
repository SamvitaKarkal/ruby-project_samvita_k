require_relative '../services/sales_calculator'
require 'stringio'
require 'rspec'

describe SalesCalculator do
  let(:calculator) { SalesCalculator.new }

  describe '#calculate_charges_per_booking' do
    it 'calculates charges for a booking and updates revenue' do
      show_number = 1
      sub_total = 500
      expect { calculator.calculate_charges_per_booking(show_number, sub_total) }.to output(/Print: Successfully Booked - Show 1/).to_stdout
      expect(calculator.revenue).to eq(sub_total)
    end
    
  end

  describe '#display_final_calculation' do
    it 'displays final sales calculation' do
      calculator.revenue = 1000
      calculator.total_service_charge = 140
      calculator.total_sb_cess = 7
      calculator.total_kk_cess = 7

      expect { calculator.display_final_calculation }.to output("Total Sales:\nRevenue: 1000.0\nService Tax: 140.0\nSwachh Bharat Cess: 7.0\nKrishi Kalyan Cess: 7.0\n").to_stdout
    end
  end
end
