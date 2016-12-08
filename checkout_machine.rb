require_relative 'scanner'
require_relative 'item'
require_relative 'bogo_machine'
require_relative 'tally_keeper'
require 'pry'

class CheckoutMachine
  def initialize
    @tally_keeper = TallyKeeper.new
    @items_scanned = {}
    @balance = 0
  end

  def scan(sku)
    @tally_keeper.scan(sku)
  end

  def total
    @tally_keeper.items_scanned.each do |_k, item|
      final_price = bonus_card_scanned? ? item[:discounted_price] : item[:price]
      @balance += final_price * item[:number]
    end
    apply_discount if bonus_card_scanned?
    @balance
  end

  private

  def apply_discount
    @balance -= BOGOMachine.new(@tally_keeper.items_scanned).discount
  end

  def bonus_card_scanned?
    @tally_keeper.items_scanned.has_key?(000)
  end
end
