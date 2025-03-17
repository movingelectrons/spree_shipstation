# frozen_string_literal: true

Spree::Core::Engine.add_routes do
  post "/shipstation", to: "jship#postshipment"
  get "/shipstation", to: "jship#listshipments"
end
