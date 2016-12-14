class Scanner
  def initialize
    @item_tally = {}
  end

  def scan(sku)
    number = number_of(sku) + 1
    @item_tally[sku] = number
  end

  def number_of(sku)
    @item_tally.has_key?(sku) ? @item_tally[sku] : 0
  end

  def items_scanned
    @item_tally.keys
  end
end
