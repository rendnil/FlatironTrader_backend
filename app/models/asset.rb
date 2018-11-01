class Asset < ApplicationRecord
  has_many :trades
  has_many :users, through: :trades


end
