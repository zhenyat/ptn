#require "ptn/version"
require 'ptn/setpar'
require 'ptn/methods_pool'
require 'ptn/candle'
require 'ptn/patrec'

module Ptn
  class Sample
    def say_hello
      puts Ptn::colored BLUE, "Hello from Ptn! Just first test" 
    end
  end
end


