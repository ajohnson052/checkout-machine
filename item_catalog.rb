require_relative 'item'
require_relative 'discount_item'
require_relative 'surcharge_item'

class ItemCatalog
  def self.get_item(sku)
    hash = case sku
    when 123
      { sku: 123, description: 'chips', price:  200 , buy_x_get_one: 2 }
    when 456
      { sku: 456, description: 'salsa', price:  100, discount: 0.5 }
    when 789
      { sku: 789, description: 'wine',  price: 1000 }
    when 111
      { sku: 111, description: 'cigarettes', price: 500, surcharge: 50 }
    when 000
      { sku: 000, description: 'bonus_card' }
    end
    return DiscountItem.new(hash) if hash.has_key?(:discount)
    return SurchargeItem.new(hash) if hash.has_key?(:surcharge)
    Item.new(hash)
  end
end
