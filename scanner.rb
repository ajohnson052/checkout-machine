class Scanner
  def get_item(sku)
    item = case sku
    when 123
      Item.new(123, 'chips', 200, 0)
    when 456
      Item.new(456, 'salsa', 100, 0.5)
    when 789
      Item.new(789, 'wine', 1000, 0)
    when 111
      Item.new(111, 'cigarettes', 550, 0)
    when 000
      Item.new(000, 'bonus_card', 0, 0)
    end
  end
end
