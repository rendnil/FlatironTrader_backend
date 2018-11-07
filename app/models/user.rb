class User < ApplicationRecord
  has_secure_password

  has_many :trades
  has_many :assets, through: :trades

  validates :username, uniqueness: {case_sensitive: false}


#########################################################################
#methods for calculating position and PnL#
#########################################################################
#central concept: profit/loss (PnL) = (live price - volume weighted average price (VWAP)) * net position
#ex. if user is short 1 coin at 6,000 USD and live price is 6,100 USD
# PnL = (6,100 - 6,000) * (-1) = -100 USD


  #calculate the net position in a given crypto for a user
  def net_position
    position_obj = { }
    position = 0
    self.trades.each do |trade|

      #check if the asset exists
      if !position_obj[trade.asset.symbol]

      #check if a long position
        if trade.buy == true
          position_obj[trade.asset.symbol] = trade.quantity

        #else position is a sale
        else
          position_obj[trade.asset.symbol] =- trade.quantity
        end

      else
        if trade.buy == true
          position_obj[trade.asset.symbol] += trade.quantity

        #else position is a sale
        else
          position_obj[trade.asset.symbol] -= trade.quantity
        end



      end
      puts position_obj
    end
    position_obj
  end


  #calculate volume weighted average price
  #VWAP = (sum(P*Q)/(sum Q))
  def weighted_price

    #check if the user has any trades
    if self.net_position == 0
      vwap = 0
    else
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
  end






end  #end User class
