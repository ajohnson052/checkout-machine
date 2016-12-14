class Scanner
  attr_reader :items_scanned

  def initialize
    @items_scanned = {}
  end

  def scan(sku)
    item = ItemCatalog.get_item(sku)
    update_items(item)
  end

  private

  def update_items(item)
    number = number_of(item.sku) + 1
    @items_scanned[item.sku] = number
  end

  def number_of(sku)
    @items_scanned.has_key?(sku) ? @items_scanned[sku] : 0
  end
end
