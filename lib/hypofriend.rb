# frozen_string_literal: true

require 'hypofriend/offer'
require 'hypofriend/client'

module Hypofriend
  class FetchError < StandardError
  end

  def self.new
    Client.new
  end
end
