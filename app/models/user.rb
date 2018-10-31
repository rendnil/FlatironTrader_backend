class User < ApplicationRecord
  has_secure_password

  has_many :trades

  validates :username, uniqueness: {case_sensitive: false}


#########################################################################
#methods for calculating position and PnL#
#########################################################################
#central concept: profit/loss (PnL) = (live price - volume weighted average price (VWAP)) * net position
#ex. if user is short 1 coin at 6,000 USD and live price is 6,100 USD
# PnL = (6,100 - 6,000) * (-1) = -100 USD


  #calculate the net position in a given crypto for a user
  def net_position
    position = 0
    self.trades.each do |trade|

      #check if a long position
      if trade.buy == true
        position += trade.quantity

      #else position is a sale
      else
        position -= trade.quantity
      end
    end
    position
  end


  #calculate volume weighted average price
  #VWAP = (sum(P*Q)/(sum Q))
  def weighted_price
    total_usd = 0

    self.trades.each do |trade|
      if trade.buy == true
        total_usd += (trade.price * trade.quantity)
      else
        total_usd -= (trade.price * trade.quantity)
      end
    end

    vwap = total_usd/self.net_position
  end





end  #end User class
