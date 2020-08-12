class Meal
  attr_accessor :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip=0)  # now all the details of each meal instance. That includes not only the total cost and the tip
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self   #  know all the details of each meal instance. That includes not only the total cost and the tip
  end               #  but also who the customer and waiter were for each meal.

  def self.all
    @@all
  end

end
