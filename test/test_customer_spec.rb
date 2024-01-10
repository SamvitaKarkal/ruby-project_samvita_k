require_relative '../services/customer'
require 'stringio'
require 'rspec'

RSpec.describe Customer do
  # describe 'customer' do
    let(:customer) { Customer.new }

    before do
      $stdin = StringIO.new
    end

    after do
      $stdin = STDIN
    end

    context '#select_show_number' do
      it 'displays text to request user input' do
        allow(customer).to receive(:gets).and_return("1\n")
        expect { customer.select_show_number }.to output(/Input: \n Enter Show no: /).to_stdout
      end

      it "returns the entered show number" do
        valid_input = "2\n"
        allow(customer).to receive(:gets).and_return(valid_input)
        show_number = customer.select_show_number

        expect(show_number).to eq(2)
      end
      
      it 'displays an error message for invalid show number' do
        allow(customer).to receive(:gets).and_return("5\n")
        expect { customer.select_show_number }.to output(/The Show number is invalid/).to_stdout
      end

      it 'displays an error message when no show number is entered' do
        allow(customer).to receive(:gets).and_return("\n")
        expect { customer.select_show_number }.to output(/The Show number is invalid/).to_stdout
      end
    end


    context '#select_required_seats' do
      it 'displays text to request user input' do
        allow(customer).to receive(:gets).and_return("\n")
        expect { customer.select_required_seats }.to output(/Enter seats: /).to_stdout
      end

      it "returns the entered seats" do
        valid_input = "A1, A2\n"
        allow(customer).to receive(:gets).and_return(valid_input)
        seats = customer.select_required_seats

        expect(seats).to eq(["A1", "A2"])
      end

      it 'displays an error message when no seats are entered' do
        allow(customer).to receive(:gets).and_return("\n")
        expect { customer.select_required_seats }.to output(/No seats entered. Please try again!/).to_stdout
      end
    end


    context '#select_proceed_option' do
      it 'displays text to return true' do
        allow(customer).to receive(:gets).and_return("y\n")
        expect { customer.select_proceed_option }.to output("Would you like to continue (Yes/No):\n\n").to_stdout
        expect(customer.select_proceed_option).to eq(true)
      end

      it 'returns true' do
        allow(customer).to receive(:gets).and_return("yes\n")
        expect { customer.select_proceed_option }.to output("Would you like to continue (Yes/No):\n\n").to_stdout
        expect(customer.select_proceed_option).to eq(true)
      end

      it 'returns false' do
        allow(customer).to receive(:gets).and_return("no\n")
        expect { customer.select_proceed_option }.to output("Would you like to continue (Yes/No):\n\n").to_stdout
        expect(customer.select_proceed_option).to eq(false)
      end
  
      it 'returns false for "n"' do
        allow(customer).to receive(:gets).and_return("n\n")
        expect { customer.select_proceed_option }.to output("Would you like to continue (Yes/No):\n\n").to_stdout
        expect(customer.select_proceed_option).to eq(false)
      end

      it 'prompts user to try again and returns the correct value' do
        allow(customer).to receive(:gets).and_return("invalid\n", "yes\n")
        expected_output = "Would you like to continue (Yes/No):\n\n" +
                          "Invalid option. Please try again!\n" +
                          "Would you like to continue (Yes/No):\n\n"
        expect { customer.select_proceed_option }.to output(expected_output).to_stdout
        expect(customer.select_proceed_option).to eq(true)
      end
    end
  # end
end
