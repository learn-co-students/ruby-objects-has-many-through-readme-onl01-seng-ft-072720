require "pry"

class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end

  def best_tipper
    tips = Meal.all.collect{|meal| meal.tip}
    tips.sort!
    tips.reverse!
    Meal.all.detect{|meal| meal.tip == tips[0]}.customer
  end

end
