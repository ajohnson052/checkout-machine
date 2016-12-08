class Item
  attr_reader :sku, :price, :discount

  def initialize(sku, description, price, discount)
    @sku = sku
    @description = description
    @price = price
    @discount = discount
  end

  def discounted_price
    price - discount * price
  end
end
