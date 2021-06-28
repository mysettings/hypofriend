# frozen_string_literal: true

module Hypofriend
  class Offer
    attr_reader :institution_name, :borrowing_rate

    def initialize(institution_name:, borrowing_rate:)
      @institution_name = institution_name
      @borrowing_rate = borrowing_rate
    end
  end
end
