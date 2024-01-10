require_relative '../services/theatre'
require 'stringio'
require 'rspec'

RSpec.describe Theatre do
  describe 'theatre' do
    let(:theatre) { Theatre.new }

    before do
      $stdin = StringIO.new
    end

    after do
      $stdin = STDIN
    end

    context '#print_seating_arrangement' do
      it 'prints the seating arrangement correctly' do
        allow($stdout).to receive(:puts) { |message| $stdin.puts(message) }

        theatre.print_seating_arrangement
        expect { theatre.print_seating_arrangement }.to output(/Seating arrangement:/).to_stdout

        $stdin.rewind
        actual_output = $stdin.read

        expected_output = <<~OUTPUT
          Seating arrangement:
          Show 1 Running in Audi 1:
          All Seats:
          A1 A2 A3 A4 A5 A6 A7 A8 A9 A10
          B1 B2 B3 B4 B5 B6
          C2 C3 C4 C5 C6 C7
          
          Show 2 Running in Audi 2:
          All Seats:
          A1 A2 A3 A4 A5 A6 A7
          B2 B3 B4 B5 B6
          C1 C2 C3 C4 C5 C6 C7
          D1 D2
        
          Show 3 Running in Audi 3:
          All Seats:
          A1 A2 A3 A4 A5 A6 A7
          B1 B2 B3 B4 B5 B6 B7 B8
          C1 C2 C3 C4 C5 C6 C7 C8 C9

        OUTPUT

        expect(actual_output).to eq(expected_output)
      end
    end
  end
end
