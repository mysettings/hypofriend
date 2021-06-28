# frozen_string_literal: true

require 'httparty'

module Hypofriend
  class Client
    BASE_URI = 'https://offer-v3.hypofriend.de'

    include HTTParty
    base_uri BASE_URI

    def new_offer(loan_amount:, property_value:, repayment:, years_fixed:)
      response = self.class.get(
        '/api/v5/new-offers',
        {
          query: {
            loan_amount: loan_amount,
            property_value: property_value,
            repayment: repayment,
            years_fixed: years_fixed
          }
        }
      )
      raise FetchError.new(response.body) unless response.success?
      JSON.parse(response.body).dig('data', 'offers')&.map do |offer|
        Offer.new(
          institution_name: offer['institution_name'],
          borrowing_rate: offer['borrowing_rate']
        )
      end
    end
  end
end
