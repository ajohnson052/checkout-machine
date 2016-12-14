class BOGOMachine
  def initialize(items_scanned)
    @items_scanned = items_scanned
  end

  def discount
    return 0 unless @items_scanned.has_key?(123)
    item = ItemCatalog.get_item(123)
    item.price * (@items_scanned[123]/3).floor
  end
end
