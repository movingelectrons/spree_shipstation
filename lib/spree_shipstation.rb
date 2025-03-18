# frozen_string_literal: true

require "spree_core"
require "spree_extension"

require "spree_shipstation/configuration"

module SpreeShipstation
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end