class CartItemsController < ApplicationController
  def create
    @cart_item = current_user.cart_items.find_by(price: cart_item_params[:price])
    if @cart_item.nil?
      @cart_item = current_user.cart_items.create(cart_item_params)
    else
      @cart_item.quantity += cart_item_params[:quantity].to_i
      @cart_item.save
    end
    if !@cart_item.valid?
      flash[:error] = @cart_item.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:price, :quantity)
  end
end
