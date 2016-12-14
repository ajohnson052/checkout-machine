class BalanceKeeper
  def initialize(scanner)
    @scanner = scanner
    @items_scanned = scanner.items_scanned
    @balance = 0
  end

  def total
    @items_scanned.each do |sku|
      item = ItemCatalog.get_item(sku)
      final_price = bonus_card_scanned? ? item.discounted_price : item.price
      @balance += final_price * @scanner.number_of(sku)
    end
    apply_discount if bonus_card_scanned?
    @balance
  end

  private

  def apply_discount
    @balance -= BOGOMachine.new(@scanner).discount
  end

  def bonus_card_scanned?
    @items_scanned.include?(000)
  end
end
