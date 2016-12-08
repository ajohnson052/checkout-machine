require_relative 'scanner'
require_relative 'item'
require_relative 'bogo_machine'
require_relative 'tally_keeper'
require_relative 'balance_keeper'
require 'pry'

class CheckoutMachine
  def initialize
    @tally_keeper = TallyKeeper.new
  end

  def scan(sku)
    @tally_keeper.scan(sku)
  end

  def total
    BalanceKeeper.new(@tally_keeper.items_scanned).total
  end
end
