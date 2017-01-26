class Item
  attr_accessor :sku, :price, :description, :price_with_bonus_card

  def initialize(hash)
    @sku = hash[:sku]
    @description = hash[:description]
    @price = hash[:price] || 0
    @price_with_bonus_card = price
    adjust_price(hash)
  end

  def adjust_price(hash)
    price
  end
end
