# frozen_string_literal: true

module Spree
  class ShipstationController < Spree::BaseController

    def authenticate_shipstation
      authenticate_or_request_with_http_basic do |username, password|
        username == SpreeShipstation.configuration.username &&
          password == SpreeShipstation.configuration.password
      end
    end

    protect_from_forgery with: :null_session, only: :postshipment

    before_action :authenticate_shipstation

    def listshipments
      @ss = Spree::Shipment.where(state: "ready")
      @total = @ss.count

      respond_to do |format|
        format.html { render layout: false }
      end
    end

    def postshipment
      doc = Nokogiri::XML(request.raw_post) do |config|
        config.nononet # networking gets turned off during parsing if this isnt set
      end
      order_number = doc.at_css("ShipNotice OrderNumber").text
      tracking_number =  doc.at_css("ShipNotice TrackingNumber").text
      if tracking_number.nil? then raise "NO TRACKING NUMBER PROVIDED!" end
      #carrier  = doc.at_css("ShipNotice Carrier").text
      order = Spree::Shipment.where("number = ?", order_number)
      order.update(tracking: tracking_number)
      order.update(state: 'shipped')
      head :ok
    rescue
      head :bad_request      
    end
  end

end
