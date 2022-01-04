class ProductsController < ApplicationController
  def index
    @products = Stripe::Price.list(
      active: true,
      type: 'one_time',
      currency: 'usd',
      expand: ['data.product'],
    )
  end

  def show
    @product = Stripe::Price.retrieve(
      params[:id],
      expand: ['product']
    )
  end
end
