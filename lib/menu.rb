class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
      "Hunor's special" => 12.99,
      "Margherita" => 9.99,
      "Vegeterian" => 9.99,
      "Hawaiian" => 10.99
    }
  end

  def display_menu
    puts "Menu:"
    @dishes.each_with_index do |(dish, price), index|
      puts "#{index + 1}. #{dish}: £#{price}"
    end
  end
  

  def price_of(dish)
    @dishes[dish]
  end

  def available?(dish)
    #.key? method is used to check if a given key exists in a hash
    @dishes.key?(dish.capitalize) 
  end
end