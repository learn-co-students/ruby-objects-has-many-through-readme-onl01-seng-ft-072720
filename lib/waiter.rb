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

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip) #order of arguments for Meal.new() remains the same - a waiter, a customer, a total and a tip.
  end

  def meals
    Meal.all.select do |meal|  # the waiter needs a way to get all the meals they have served.
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|  # use the array we get from #meals
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer  #  return the customer of the meal with the highest tip
  end

end
