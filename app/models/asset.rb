class Asset < ApplicationRecord
  has_many :trades, dependent: :destroy
  has_many :users, through: :trades


end
