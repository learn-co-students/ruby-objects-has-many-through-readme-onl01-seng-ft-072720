class Customer
    attr_accessor :name, :age
    @@all = []
  
    def initialize(name,age)
      @name = name
      @age = age
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    # A Customer creates a Meal, passing in a Waiter instance
    def new_meal(waiter, total, tip=0)
      Meal.new(waiter, self, total, tip)
    end
  
    # In plain English, the customer is going to look at all of the meals, and then select only the ones that belong to them. Translated into code, that could be written like the following:
    # We're iterating through every instance of Meal and returning only the ones where the meal's customer matches the current customer instance.
    def meals
      Meal.all.select do |meal|
          meal.customer == self
      end
    end
      def waiters
          meals.map do |meal|
              meal.waiter
          end
      end
   
  end