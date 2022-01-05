class ProductsController < ApplicationController
  def index
    @products = Stripe::Price.list(
      active: true,
      type: 'one_time',
      currency: 'usd',
      expand: ['data.product'],
    )
  end
end
