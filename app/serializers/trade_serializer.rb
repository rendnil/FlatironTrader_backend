class TradeSerializer < ActiveModel::Serializer
  attributes :symbol, :buy, :price, :quantity
end
