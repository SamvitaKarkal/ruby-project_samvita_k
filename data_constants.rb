module DataConstants
  THEATRE_LAYOUT = {
    1 => {
    'Platinum' => %w[A1 A2 A3 A4 A5 A6 A7 A8 A9 A10],
    'Gold' => %w[B1 B2 B3 B4 B5 B6],
    'Silver' => %w[C2 C3 C4 C5 C6 C7]
    },
    2 => {
    'Platinum' => %w[A1 A2 A3 A4 A5 A6 A7],
    'Gold' => %w[B2 B3 B4 B5 B6],
    'Silver' => %w[C1 C2 C3 C4 C5 C6 C7],
    'Diamond' => %w[D1 D2]
    },
    3 => {
    'Platinum' => %w[A1 A2 A3 A4 A5 A6 A7],
    'Gold' => %w[B1 B2 B3 B4 B5 B6 B7 B8],
    'Silver' => %w[C1 C2 C3 C4 C5 C6 C7 C8 C9]
    },
  }

  TICKET_RATES = {
    'Platinum' => 320,
    'Gold' => 280,
    'Silver' => 240,
    'Diamond' => 350
  }

  TAX_RATES = {
    'service_tax' => 0.14,
    'swatch_bharat_cess' => 0.005,
    'krishi_kalyan_cess' => 0.005
  }
end
