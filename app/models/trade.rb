class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  ##need validations

end
