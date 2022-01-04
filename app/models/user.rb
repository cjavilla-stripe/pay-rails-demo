class User < ApplicationRecord
  pay_customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  after_commit :maybe_set_payment_processor

  def maybe_set_payment_processor
    if !self.pay_customers.present?
      set_payment_processor(:stripe)
    end
  end
end
