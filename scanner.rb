class Scanner
  def self.get_item(sku)
    hash = case sku
    when 123
      { sku: 123, description: 'chips', price:  200 }
    when 456
      { sku: 456, description: 'salsa', price:  100, discount: 0.5 }
    when 789
      { sku: 789, description: 'wine',  price: 1000 }
    when 111
      { sku: 111, description: 'cigarettes', price: 550 }
    when 000
      { sku: 000, description: 'bonus_card' }
    end
    Item.new(hash)
  end
end
