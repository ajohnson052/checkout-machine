require_relative 'item_catalog'
require_relative 'bogo_machine'
require_relative 'scanner'

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
      @balance += adjusted_price(item) * quantity
      apply_discount(item, quantity)
    end
    @balance
  end

  private

  def adjusted_price(item)
    bonus_card_scanned? ? item.price_with_bonus_card : item.price
  end

  def apply_discount(item, quantity)
    if bonus_card_scanned?
      @balance -= BOGOMachine.new(item: item, quantity: quantity).discount
    end
  end

  def bonus_card_scanned?
    @scanner.items_scanned.include?(000)
  end
end
