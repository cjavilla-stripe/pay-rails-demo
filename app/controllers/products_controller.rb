class ProductsController < ApplicationController

  # One-time prices
  def index
    @products = Stripe::Price.list(
      active: true,
      type: 'one_time',
      currency: 'usd',
      expand: ['data.product'],
    )
  end

  # Recurring SaaS prices
  def pricing
    @products = Stripe::Price.list(
      active: true,
      type: 'recurring',
      currency: 'usd',
      lookup_keys: ['startup', 'freelancer', 'enterprise'],
      expand: ['data.product'],
    ).data.sort_by { |p| p.unit_amount }
    @products.each do |price|
      price.features = JSON.parse(price.product.metadata.features)
    end
  end
end
