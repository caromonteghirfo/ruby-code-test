class Checkout
  require './lib/discount'

  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    discounts = Discount::DISCOUNTS
    basket_count = basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }

    basket_count.sum do |item, count|
      apply_discount(item, count, discounts[item])
    end
  end

  private

  def basket
    @basket ||= Array.new
  end

  def apply_discount(item, count, discount)
    price = prices.fetch(item)

    return price * count if discount.nil?

    max = discount[:restriction] > 0 ? discount[:restriction] : count

    price * (max - (max / discount[:buy]) * discount[:free] ) + price * (count - max)
  end
end
