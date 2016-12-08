class TallyKeeper
  attr_reader :items_scanned

  def initialize
    @items_scanned = {}
  end

  def scan(sku)
    item = Scanner.new.get_item(sku)
    update_items(item)
  end

  private

  def update_items(item)
    number = number_of(item.sku) + 1
    @items_scanned[item.sku] = {
      number: number,
      price: item.price,
      discounted_price: item.discounted_price
    }
  end

  def number_of(sku)
    @items_scanned.has_key?(sku) ? @items_scanned[sku][:number] : 0
  end
end
