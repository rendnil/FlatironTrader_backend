class TradeSerializer < ActiveModel::Serializer
  attributes :asset, :buy, :price, :quantity, :created_at
end
