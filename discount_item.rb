class DiscountItem < Item
  def adjust_price(options)
    @price_with_bonus_card = price - options[:discount] * price
  end
end
