class Customer
  
  attr_accessor :name, :age
 
  @@all = []
 
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)   #(the initialized instance of meal)
  end  #creates new meals and associates that meal to the customer that created it  
  
  def meals
   Meal.all.select do |meal|
     meal.customer == self # checking for all the meals the customer had
   end
  end
  
  def waiters
   meals.map do |meal|
     meal.waiter # uses meals method to return all the waiters from every meal 
   end
  end 
  
end