# frozen_string_literal: true

require 'spec_helper'

describe Hypofriend::Client do
  describe '#new_offer' do
    let(:client) { described_class.new }

    context 'fail response' do
      before do
        stub_request(:get, "https://offer-v3.hypofriend.de/api/v5/new-offers?loan_amount=350000&property_value=150000&repayment=2.0&years_fixed=20").
          with(
            headers: {
              'Accept': '*/*',
              'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent': 'Ruby'
            }).
          to_return(status: 401, body: 'Unauthorized', headers: {})
      end

      it 'raises FetchError' do
        expect do
          client.new_offer(
            loan_amount: 350000,
            property_value: 150000,
            repayment: 2.0,
            years_fixed: 20
          )
        end.to raise_error(Hypofriend::FetchError)
      end
    end

    context 'successful response' do
      before do
        stub_request(:get, "https://offer-v3.hypofriend.de/api/v5/new-offers?loan_amount=350000&property_value=150000&repayment=2.0&years_fixed=20").
          with(
            headers: {
              'Accept': '*/*',
              'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent': 'Ruby'
            }).
          to_return(
            status: 200,
            body: '{"data":{"cached":false,"offers":[{"institution_name":"MHB","borrowing_rate":1.91}]}}',
            headers: {}
          )
      end

      it 'returns offers' do
        offers = client.new_offer(
          loan_amount: 350000,
          property_value: 150000,
          repayment: 2.0,
          years_fixed: 20
        )
        expect(offers.length).to eq(1)
        offer = offers.first
        expect(offer.institution_name).to eq('MHB')
        expect(offer.borrowing_rate).to eq(1.91)
      end
    end
  end
end
