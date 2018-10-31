class UserSerializer < ActiveModel::Serializer
  has_many :trades
  attributes :id, :username, :email, :trades, :net_position, :weighted_price
end
