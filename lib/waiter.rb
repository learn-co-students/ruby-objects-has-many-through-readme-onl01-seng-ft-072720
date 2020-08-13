class Waiter
    attr_accessor :name, :yrs_experience

    @@all = Array.new

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end
    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
      end
        def customers
        meals.map do |meal|
            meal.customer
        end.map do |customer|
            customer.name
        .uniq
    end
  end
def highest_tip
        highest_tip = 0
        highest_tipper = nil
        meals.each do |customer|
            if customer.tip > highest_tip
                highest_tip = customer.tip
                highest_tipper = customer
            end
        end
        highest_tipper
    end
  def best_tipper
  best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end
 
  best_tipped_meal.customer
end
end