class TradeSerializer < ActiveModel::Serializer
  attributes :asset, :buy, :price, :quantity
end
