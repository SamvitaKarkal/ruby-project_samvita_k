require_relative '../services/process_bookings'
require 'stringio'
require 'rspec'

describe ProcessBookings do
  let(:seats_with_row) do
    {
      'Platinum' => ['A1', 'A2'],
      'Gold' => ['B1', 'B2', 'B3'],
      'Silver' => ['C1'],
      'Diamond' => ['D1']
    }
  end

  subject(:process_bookings) { described_class.new(seats_with_row) }

  describe '#calculate_booking_cost' do
    it 'calculates the correct subtotal' do
      expected_subtotal = (DataConstants::TICKET_RATES['Platinum'] * 2) +
                          (DataConstants::TICKET_RATES['Gold'] * 3) +
                          (DataConstants::TICKET_RATES['Silver'] * 1) +
                          (DataConstants::TICKET_RATES['Diamond'] * 1)

      expect(process_bookings.calculate_booking_cost).to eq(expected_subtotal)
    end

    it 'returns 0 for an empty booking' do
      empty_booking = described_class.new({})
      expect(empty_booking.calculate_booking_cost).to eq(0)
    end
  end
end
