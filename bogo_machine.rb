class BOGOMachine
  def initialize(scanner)
    @scanner = scanner
    @items_scanned = scanner.items_scanned
  end

  def discount
    return 0 unless @items_scanned.include?(123)
    item = ItemCatalog.get_item(123)
    item.price * (@scanner.number_of(123)/3).floor
  end
end
