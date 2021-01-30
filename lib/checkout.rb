class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    basket_count = basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }

    basket_count.sum do |item, count|
      item_price = prices.fetch(item)

      case item
      when :apple, :pear
        item_price * (count / 2) + item_price * (count % 2)
      when :banana
        (item_price / 2) * count
      when :pineapple
        (item_price / 2) + item_price * (count - 1)
      else
        item_price * count
      end
    end
  end

  private

  def basket
    @basket ||= Array.new
  end
end
