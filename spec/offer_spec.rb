# frozen_string_literal: true

require 'spec_helper'

describe Hypofriend::Offer do
  describe '.new' do
    it 'returns a model with attributes set from the parameters' do
      offer = described_class.new(
        institution_name: 'Hypofriend',
        borrowing_rate: 1.7
      )
      expect(offer.institution_name).to eq('Hypofriend')
      expect(offer.borrowing_rate).to eq(1.7)
    end
  end
end
