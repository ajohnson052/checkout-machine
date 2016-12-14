require_relative 'item_catalog'
require_relative 'item'
require_relative 'bogo_machine'
require_relative 'scanner'
require_relative 'balance_keeper'
require 'pry'

class CheckoutMachine
  def initialize
    @scanner = Scanner.new
  end

  def scan(sku)
    @scanner.scan(sku)
  end

  def total
    BalanceKeeper.new(@scanner).total
  end
end
