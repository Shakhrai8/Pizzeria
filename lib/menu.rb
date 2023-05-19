class Menu
  def initialize
    # Initialize the menu with a hash of dishes and prices
  end

  def display_menu
    # Display the menu with dishes and prices
    # Returns nothing
  end

  def price_of(dish)
    # Get the price of a specific dish
    # Returns the price as a float or nil if the dish is not available
  end

  def available?(dish)
    # Check if a specific dish is available
    # Returns true if available, false otherwise
  end
end