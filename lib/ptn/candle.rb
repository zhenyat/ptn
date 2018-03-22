################################################################################
#   Candle with its attributes and methods
#
#   Instance Varaibles (attr_reader)
#     Input values: 
#       @start_time   - Start time of slot
#       @low          - Minimum price
#       @open         - First price
#       @close        - Last price
#       @high         - Maximum price
#       @amount       - Candle trades amount
#
#     Calculated values:
#       @type         - Candle type
#       @avg          - Average price
#       @body         - Candle Body (Line)
#       @lower_shadow - Low Shadow (Wick) size
#       @upper_shadow - High Shadow (Wick)size
#     
#  Example of an Instance creation:
#     candle = Candle.new start_time: "04-03-2018 20:30", low: 849.89001, high: 854.86247, 
#                         open: 854.35946, close: 852.35501, amount: 112.30772151
#
#   06.03.2018  GF
#   20.03.2018  New methods
################################################################################
module Ptn
  class Candle
    attr_reader :start_time, :low, :open, :close, :high, :amount, :type, :avg, :body, :lower_shadow, :upper_shadow
   
    def initialize args
      args.each do |key, value|
        instance_variable_set("@#{key}", value) unless value.nil?
      end
      
      validate
      
      @type         = (@open >= @close) ? 'buy' : 'sell' 
      @body         = (@open >= @close) ? @open - @close : @close - @open
      @lower_shadow = (@open >= @close) ? @close - @low  : @open - @low
      @upper_shadow = (@open >= @close) ? @high - @open  : @high - @close
      @avg          = (@high + @low + @close) / 3
    end
    
    def buy?
      @type == 'buy'
    end

    def doji?
      @body < EQUAL_PERCENT / 100.0 * [@close, @open].min
    end
    
    def sell?
      @type == 'sell'
    end

    private
    
    def validate
      error_msg  = ''
      error_msg +=  "Candle's Start Time is not defined | "   if @start_time.nil?
      error_msg +=  "Candle's Low Price is not defined | "    if @low.nil?
      error_msg +=  "Candle's High Price is not defined | "   if @high.nil?
      error_msg +=  "Candle's Open Price is not defined | "   if @open.nil?
      error_msg +=  "Candle's Close Price is not defined | "  if @close.nil?
      error_msg +=  "Candle's Amount is not defined | "       if @amount.nil?
      
      raise ArgumentError.new error_msg  if !error_msg.empty?
    end
  end
end
