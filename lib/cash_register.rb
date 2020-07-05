require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :item_prices, :item_quantities

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @item_prices = []
        @item_quantities = []
    end

    def add_item(name, price, num = 1)
        self.total += (price*num)
        num.times {
            self.items << name
            self.item_prices << price 
            self.item_quantities << num
        }
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = Integer(self.total * (1 - self.discount/100.0))
            "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @item_quantities[-1].times {@total -= @item_prices[-1]}
    end
end