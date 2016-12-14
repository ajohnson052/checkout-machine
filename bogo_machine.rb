class BOGOMachine
  def initialize(hash)
    @item = hash[:item]
    @quantity = hash[:quantity]
  end

  def discount
    return 0 unless @item.sku == 123
    @item.price * (@quantity/3).floor
  end
end
