class SurchargeItem < Item
  def adjust_price(options)
    @price_with_bonus_card = @price = price + options[:surcharge]
  end
end
