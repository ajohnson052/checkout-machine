class BalanceKeeper
  def initialize(scanner)
    @scanner = scanner
    @items_scanned = scanner.items_scanned
    @balance = 0
  end

  def total
    @items_scanned.each do |sku|
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
    @items_scanned.include?(000)
  end
end
