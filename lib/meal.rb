class Meal
  @@all = []
  attr_accessor :customer, :waiter, :total, :tip
  def initialize(waiter, customer, total, tip)
    @@all << self
    @customer = customer
    @waiter = waiter
    @total = total
    @tip = tip
  end

  def self.all
    @@all
  end
end
