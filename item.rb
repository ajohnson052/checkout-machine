class Item
  attr_reader :sku, :price

  def initialize(hash)
    @sku = hash[:sku]
    @description = hash[:description]
    @price = hash[:price] || 0
    @discount = hash[:discount] || 0
  end

  def discounted_price
    @price - @discount * @price
  end
end
