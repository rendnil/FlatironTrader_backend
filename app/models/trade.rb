class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  ##need validations
  validates :quantity, :numericality => {greater_than: 0}

end
