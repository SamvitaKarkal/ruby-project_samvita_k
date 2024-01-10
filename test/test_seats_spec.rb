require_relative '../services/seats'
require 'stringio'
require 'rspec'

describe Seats do
  let(:available_seats) do
    {
      'Platinum' => ['A1', 'A2', 'A3'],
      'Gold' => ['B1', 'B2', 'B3'],
      'Silver' => ['C1', 'C2', 'C3']
    }
  end

  let(:seats) { Seats.new(available_seats) }

  describe '#display_available_seats' do
    it 'displays seats' do
      expect { seats.display_available_seats }.to output("Available Seats:\nA1, A2, A3\nB1, B2, B3\nC1, C2, C3\n").to_stdout
    end
  end

  describe '#get_seats_to_book' do
    it 'returns selected seats to book' do
      seats_entered = ['A1', 'B2', 'C3']
      selected_seats = seats.get_seats_to_book(seats_entered)
      expect(selected_seats).to eq({ 'Platinum' => ['A1'], 'Gold' => ['B2'], 'Silver' => ['C3'] })
    end

    it 'handles unavailable seats' do
      seats_entered = ['A1', 'B2', 'X1']
      expect { seats.get_seats_to_book(seats_entered) }.to output(/X1 Not available, Please select different seats/).to_stdout
    end

    it 'handles empty input' do
      seats_entered = []
      selected_seats = seats.get_seats_to_book(seats_entered)
      expect(selected_seats).to eq({})
    end
  end
end
