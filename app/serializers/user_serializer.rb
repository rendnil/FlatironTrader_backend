class UserSerializer < ActiveModel::Serializer
  has_many :trades
  attributes :id, :username, :email, :trades, :positions
end
