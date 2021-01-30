class Discount
  DISCOUNTS = {
    apple: { buy: 2, free: 1, restriction: 0 },
    pear: { buy: 2, free: 1, restriction: 0 },
    banana: { buy: 1, free: 0.5, restriction: 0 },
    mango: { buy: 3, free: 1, restriction: 0 },
    pineapple: { buy: 1, free: 0.5, restriction: 1 },
  }

  # :free indicates how many items for free you get if you select :buy items.
  # :restriction indicates the max number of items to which the discount applies

  #  examples:
  #  apple: { buy: 2, free: 1, restriction: 0 }
  #  indicates a 2x1 discount on apples (buy 2 get 1 for free) and it applies to all the :apple items you select.

  #  pineapple: { buy: 1, free: 0.5, restriction: 1 }
  #  indicates a half price discount on pineapples but it can only apply for a max of 1 item
end
