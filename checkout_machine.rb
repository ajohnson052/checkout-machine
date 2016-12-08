require_relative 'scanner'
require_relative 'item'
require_relative 'bogo_machine'
require 'pry'

class CheckoutMachine
  attr_accessor :items_scanned

  def initialize
    @items_scanned = {}
    @balance = 0
  end

  def scan(sku)
    item = Scanner.new.get_item(sku)
    update_items(item)
  end

  def total
    items_scanned.each do |_k, item|
      final_price = bonus_card_scanned? ? item[:discounted_price] : item[:price]
      @balance += final_price * item[:number]
    end
    apply_discount if bonus_card_scanned?
    @balance
  end

  private

  def apply_discount
    @balance -= BOGOMachine.new(items_scanned).discount
  end

  def update_items(item)
    number = number_of(item.sku) + 1
    items_scanned[item.sku] = {
      number: number,
      price: item.price,
      discounted_price: item.discounted_price
    }
  end

  def bonus_card_scanned?
    items_scanned.has_key?(000)
  end

  def number_of(sku)
    items_scanned.has_key?(sku) ? items_scanned[sku][:number] : 0
  end
end
