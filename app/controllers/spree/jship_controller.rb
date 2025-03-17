# frozen_string_literal: true

module Spree
  class JshipController < Spree::BaseController
    def listshipments
      @ss = Spree::Shipment.where(state: "ready")
      @total = @ss.count

      respond_to do |format|
        format.html { render layout: false }
      end
    end

    def postshipment

      respond_to do |format|
        format.html { render layout: false }
      end
    end
  end
end
