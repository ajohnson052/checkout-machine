class BalanceKeeper
  def initialize(items_scanned)
    @items_scanned = items_scanned
    @balance = 0
  end

  def total
    @items_scanned.each do |sku, number|
      item = ItemCatalog.get_item(sku)
      final_price = bonus_card_scanned? ? item.discounted_price : item.price
      @balance += final_price * number
    end
    apply_discount if bonus_card_scanned?
    @balance
  end

  private

  def apply_discount
    @balance -= BOGOMachine.new(@items_scanned).discount
  end

  def bonus_card_scanned?
    @items_scanned.has_key?(000)
  end
end
