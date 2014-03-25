require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test 'add different products' do
    @cart = carts(:one)

    @cart.add_product products(:one)
    @cart.add_product products(:ruby)

    @cart.line_items.each do |line_item|
      assert_equal line_item.quantity, 1
    end
  end

  test 'add same product' do
    @cart = carts(:one)

    2.times { @cart.add_product products(:ruby) }

    @cart.line_items.each do |line_item|
      assert_equal line_item.quantity, 2
    end
  end
end
