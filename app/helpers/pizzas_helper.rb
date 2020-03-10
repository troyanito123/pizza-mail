module PizzasHelper

  def save_cost(cost)
    session[:cost] = cost
  end

  def save_size(size)
    session[:size] = size
  end

  def save_ingredients(ingredients)
    session[:ingredients] = ingredients
  end

  def current_cost
    @cost = session[:cost]
  end

  def current_size
    @size = session[:size]
  end

  def current_ingredients
    @ingredients = session[:ingredients]
  end

  def current_name
    "Pizza #{current_size} with #{current_ingredients.first} and #{current_ingredients.last}"
  end

  def save_changes_on_pizza
    pizza = create_pizza
    save_cost(pizza.get_cost(current_size))
  end

  # Return a Object pizza with ingredient
  def create_pizza
    pizza = PizzaModule::PizzaDefault.new
    factory = PizzaModule::PizzaFactory
    current_ingredients.each do |ingredient|
      pizza_with_ingredient = factory.get_ingredient(ingredient).new pizza
      pizza = pizza_with_ingredient
    end
    pizza
  end

  # Return array of Ingredient
  def get_ingredients
    current_ingredients.collect { |ingredient| Ingredient.find_by(code: ingredient) }
  end

end
