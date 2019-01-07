class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  ##need validations
  validates :quantity, :numericality => {greater_than: 0, less_than_or_equal_to: 100}

end
