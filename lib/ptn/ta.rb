################################################################################
# Technical Analysis methods
#
# 19.03.2018  GF
################################################################################

module Ptn
  ##############################################################################
  #  Adaptive Moving Average
  #  
  #  Direction  = Price - price(n) ; where n = AMA Period 
  #  Volatility = Sum(abs(price - price[1], n)
  #  Effeciency Ratio (ER) = Direction / Volatility 
  #  Fast Smoothing Constant (FastC) = 2/(p + 1) ; where p = FSC Period 
  #  Slow Smoothing Constant (SlowC) = 2/(q + 1) ; where q = FSC Period 
  #  Scaled Smoothing Constant 
  #   (SSC) = ER(FastC - SlowC) + SlowC c = SSC*SSC AMA = AMA[1] + c(price - AMA[1])
  #   
  #   AMA Period     - Period used to calculate the Direction as seen in the formula above.
  #                    (10 is recommended)
  #   Fast SC Period - Period used to calculate the fast smoothing constant 
  #                    (2 is recommended) 
  #   Slow SC Period - Period used to calculate the slow smoothing constant
  #                    (30 is recommended)
  #  
  #  https://www.linnsoft.com/techind/adaptive-moving-average-ama
  #  
  #  See Also: S&C, 1998 Bonus Issue, p. 34.
  ##############################################################################
  def self.ama
    
  end
end