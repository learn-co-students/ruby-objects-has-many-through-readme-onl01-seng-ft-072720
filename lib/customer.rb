class Customer
  attr_accessor :name, :age # has a name and an age (can change)

  @@all = []  #knows about all cusotmers

  def initialize(name, age)
    @name = name    #name and age are set upon initialization
    @age = age
    @@all << self  #knows about all cusotmers (tracks every instance of customer upon creation)
  end

  def self.all  #knows about all cusotmers
    @@all
  end

  def new_meal(waiter, total, tip=0) # take in an instance of a waiter and supply the total and tip, which we'll have defaulted to 0 here as well
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|  #  the customer is going to look at all of the meals, and then select only the ones that belong to them
      meal.customer == self  #  returning only the ones where the meal's customer matches the current customer instance.
    end
  end

  def waiters
    meals.map do |meal|  #   take the array of all of Rachel's meals, map over it, getting the waiter from each of those meals.
      meal.waiter
    end
  end




end
