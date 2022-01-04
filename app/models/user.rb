class User < ApplicationRecord
  pay_customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :cart_items

  after_commit :maybe_set_payment_processor

  def maybe_set_payment_processor
    if !self.pay_customers.present?
      set_payment_processor(:stripe)
    end
  end

  def cart_count
    cart_items.sum(:quantity)
  end

  def cart_line_items
    cart_items.map do |cart_item|
      {
        quantity: cart_item.quantity,
        price: cart_item.price
      }
    end
  end
end
