# frozen_string_literal: true

Spree::Core::Engine.add_routes do
  post "/shipstation", to: "shipstation#postshipment"
  get "/shipstation", to: "shipstation#listshipments"
end
