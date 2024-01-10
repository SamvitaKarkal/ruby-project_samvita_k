require_relative '../services/show'
require 'stringio'
require 'rspec'

describe Show do
  let(:show) { Show.new }

  describe '#set_show_number' do
    it 'sets the show number' do
      show.set_show_number(1)
      expect(show.instance_variable_get(:@show_number)).to eq(1)
    end
  end

  describe '#calculate_available_show_seats' do
    it 'returns all seats if none are booked' do
      expect(show.calculate_available_show_seats).to eq(DataConstants::THEATRE_LAYOUT[0])
    end

    it 'returns available seats when some are booked' do
      show.set_show_number(1)
      show.update_booked_seats({ 'Platinum' => ['A1', 'A2'], 'Gold' => ['B1', 'B2'] })
      expect(show.calculate_available_show_seats['Platinum']).to eq(['A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10'])
      expect(show.calculate_available_show_seats['Gold']).to eq(['B3', 'B4', 'B5', 'B6'])
    end
  end

  describe '#update_booked_seats' do
    it 'updates booked seats' do
      show.set_show_number(1)
      show.update_booked_seats({ 'Platinum' => ['A1', 'A2'], 'Gold' => ['B1', 'B2'] })
      expect(show.instance_variable_get(:@seats_booked)).to eq({ 1 => { 'Platinum' => ['A1', 'A2'], 'Gold' => ['B1', 'B2'] } })
    end

    it 'adds new booked seats to existing ones' do
      show.set_show_number(1)
      show.update_booked_seats({ 'Platinum' => ['A1', 'A2'] })
      show.update_booked_seats({ 'Gold' => ['B1', 'B2'] })
      expect(show.instance_variable_get(:@seats_booked)).to eq({ 1 => { 'Platinum' => ['A1', 'A2'], 'Gold' => ['B1', 'B2'] } })
    end
  end
end
