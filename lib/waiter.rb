class Waiter
attr_accessor :years_of_experience
attr_reader :name

@@all = []

def initialize(name, years)
  @name = name
  @years_of_experience = years
  @@all << self
end

def self.all
  @@all
end

def new_meal(customer, total, tip)
  meal = Meal.new(self, customer, total, tip)
end

def meals
  Meal.all.find_all {|meal| meal.waiter == self}
end

def best_tipper
  highest = Meal.all.first
  Meal.all.each do |meal|
    if meal.tip > highest.tip
    highest = meal
  end
end
highest.customer
end






end
