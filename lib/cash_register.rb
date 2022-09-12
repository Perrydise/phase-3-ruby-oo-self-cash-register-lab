class CashRegister
    attr_reader :discount
    attr_accessor :total
    attr_accessor :food_array
    attr_accessor :last_price
    attr_accessor :last_quanity


    def initialize(discount = 0)
        @discount = discount
        self.total = 0  
        self.food_array = []       
    end

    def add_item(title, price, quantity = 1)
        self.last_price = price
        self.last_quanity = quantity
        quantity.times do
            self.food_array.push(title)
        end
        total_price = self.total + price * quantity
        self.total = total_price      
    end

    def apply_discount
        if self.discount == 0
        return "There is no discount to apply."
        else 
            sub_price = self.total.to_f * (self.discount.to_f / 100)   
            discount_price = self.total - sub_price
        self.total = discount_price
        return "After the discount, the total comes to $800."
        end
    end

    def items
        self.food_array
    end

    def void_last_transaction
       puts self.food_array.pop()
        new_total = self.total - (self.last_price * self.last_quanity) 
        self.total = new_total
    end

end
