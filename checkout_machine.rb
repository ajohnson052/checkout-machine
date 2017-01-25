require_relative 'item_catalog'
require_relative 'item'
require_relative 'bogo_machine'
require_relative 'scanner'
require 'pry'

class CheckoutMachine
  def initialize
    @scanner = Scanner.new
    @balance = 0
  end

  def scan(sku)
    @scanner.scan(sku)
  end

  def total
    @scanner.items_scanned.each do |sku|
      item = ItemCatalog.get_item(sku)
      quantity = @scanner.number_of(sku)
      final_price = bonus_card_scanned? ? item.discounted_price : item.price
      @balance += final_price * quantity
      apply_discount(item, quantity) if bonus_card_scanned?
    end
    @balance
  end

  private

  def apply_discount(item, quantity)
    @balance -= BOGOMachine.new(item: item, quantity: quantity).discount
  end

  def bonus_card_scanned?
    @scanner.items_scanned.include?(000)
  end
end
