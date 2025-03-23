# spree_shipstation

The spree_shipstation extension connects your Spree store with [ShipStation](https://www.shipstation.com), allowing ShipStation to pull shipments from your store, and when a shipment is sent, update the order with a tracking number and mark it as shipped.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    gem "spree_shipstation", github: "movingelectrons/spree_shipstation"
    ```

2. Install the gem using Bundler

    ```shell
    bundle install
    ```

3. Run the install the generator (just copies over one config file)

    ```shell
    bundle exec rails generate spree_shipstation:install
    ```

## Configuration

### Configuring Spree

Configure your spree_shipstation Spree extension using the `spree_shipstation.rb` file.

```ruby
# config/initializers/spree_shipstation.rb

SpreeShipstation.configure do |config|
  # Choose between Grams, Ounces or Pounds.
  config.weight_units = "Grams"

  # ShipStation expects the endpoint to be protected by HTTP Basic Auth.
  # Set the username and password you desire for ShipStation to use.
  config.username = "create-a-username"
  config.password = "set-a-new-password"
end
```

### Configuring ShipStation

Create a new ShipStation store by visiting: **Settings** -> **Selling Channels** -> **Stores** -> **Add Store**, then selecting the **Custom Store** option.

Enter the following details:

- **Username**: the username defined in your config.
- **Password**: the password defined in your config.
- **URL to custom page**: `https://yourdomain.com/shipstation`.

There are five shipment states for an order (= shipment) in ShipStation. These states do not
necessarily align with Spree, but you can configure ShipStation to create a mapping for your
specific needs. Here's the default mapping:

ShipStation description | ShipStation status | Spree status
------------------------|--------------------|---------------
Awaiting Payment        | `unpaid`           | `pending`
Awaiting Shipment       | `paid`             | `ready`
Shipped                 | `shipped`          | `shipped`
Cancelled               | `cancelled`        | `cancelled`
On-Hold                 | `on-hold`          | `pending`

## Usage

There's nothing you need to do. Once properly configured, the integration just works!

### Compatibility

This extension works with the following Spree versions:

- 4.9.x -- ok it was compatible, its broken now for whatever reason, I decided to try and intergrate shippo instead because i have a old account that dosent require a monthly fee,  shipstation requires a monthly fee, i only integrated it because it seemed like it would be the qickest to do, but its broken now and i dont want to fix it.

## Gotchas

There are a few gotchas you need to be aware of:

- If you change the shipping method of an order in ShipStation, the change will not be reflected in Spree and the tracking link might not work properly.

## License

2025 modified heavily by Jerome Stonebridge, 
origional Copyright (c) 2020 Matthew Kennedy, 
released under the New BSD License.  