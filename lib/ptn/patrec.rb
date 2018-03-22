################################################################################
#   Recognizes patterns
#
#   color:   hollow   | filled  - not needed
#   outcome: reversal | continuation
#   
#   *reversal*     patterns predict a change in price direction, 
#   *continuation* patterns predict an extension in the current price direction
#
#   https://www.linnsoft.com/techind/candlestick-pattern-recognition-cpr
#####   
=begin
  Recognized Patterns:
    Abandoned Baby Top
    Advance Block
    Belt Hold - Bearish
    Belt Hold - Bullish
    Counter Attack-Bearish
    Counter Attack-Bullish
    Dark Cloud Cover
    Engulfing-Bearish
    Engulfing-Bullish
    Evening Doji Star
    Evening Star
    Falling Three Method
    Gravestone Doji
    Hammer
    Hanging Man
    Harami-Bullish
    Harami Cross-Bullish
    Harami -Bearish
    Harami Cross-Bearish
    High Wave
    In Neck
    Inverted Hammer
    Long Legged Doji
    Mat Hold
    Morning Doji Star
    Morning Star
    Piercing Line
    Rising Three
    Separating Line-Bearish
    Separating Line-Bullish
    Shooting Star
    Side by Side Wide Gap Down
    Side by Side Wide Gap Up
    Stalled
    Tasuki Downside Gap
    Tasuki Upside Gap
    Three Gaps Down
    Three Gaps Up
    Three Soldiers-Bullish
    Thrusting Line
    Upside Gap 2 Crows

  Characteristics:
    (Marker) Color:  White (close > open)| Black (close < open)

    Shape
      Long:   Body is larger than the average of all candle body lengths in the chart 
      Small:  Body is anywhere between Long and Doji.
      Doji:   Body is less than EP% of the lowest body price: ABS(CL - OP) < (EP/100) * MIN(CL, OP)

    Top Shadow / Upper Wick
      Long    >= LONG_SHADOW  * Body_Length (default)
      Small   <  SMALL_SHADOW * Body_Length
      Medium     is anywhere in between

    Bottom Shadow / Lower Wick
      Long    >= LONG_SHADOW  * Body_Length (default)
      Small   <  SMALL_SHADOW * Body_Length
      Medium     is anywhere in between 
=end
#
#   22.03.2018  GF
################################################################################
module Ptn
#  attr_reader :candle
  class Patrec
    def self.identify_single candle
      color = candle.type == 'sell' ? Ptn::GREEN : RED
      puts Ptn::colored color,"#{candle.avg} - #{candle.amount} - #{candle.type} "
    end
    
    def self.shape candle, grand_body_avg
      if (candle.body) < EQUAL_PERCENT / 100.0 * [candle.open, candle.close].min()
        'doji'
      elsif candle.body >= grand_body_avg
        'long'
      else
        'small'
      end
    end
    
    def self.top_shadow candle
      if candle.upper_shadow   >= LONG_SHADOW  * candle.body
        'long'
      elsif candle.upper_shadow < SMALL_SHADOW * candle.body
        'small'
      else
        'medium'
      end
    end
    
     def self.bottom_shadow candle
      if candle.lower_shadow   >= LONG_SHADOW  * candle.body
        'long'
      elsif candle.lower_shadow < SMALL_SHADOW * candle.body
        'small'
      else
        'medium'
      end
      
    end
  end
end
