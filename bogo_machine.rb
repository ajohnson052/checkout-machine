class BOGOMachine
  attr_reader :items_scanned

  def initialize(items_scanned)
    @items_scanned = items_scanned
  end

  def discount
    return 0 unless items_scanned.has_key?(123)
    items_scanned[123][:price] * (items_scanned[123][:number]/3).floor
  end
end
