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

  # Return a Object pizza
  def create_pizza
    pizza = PizzaModule::PizzaDefault.new
    current_ingredients.each do |ingredient|
      pizza_with_ingredient = get_class(pizza, ingredient)
      pizza = pizza_with_ingredient
    end
    pizza
  end

  # Return array of Ingredient
  def get_ingredients
    current_ingredients.collect { |ingredient| Ingredient.find_by(code: ingredient) }
  end


  private
  def get_class(pizza, ingredient)
    case ingredient
    when 'parmesan'
      PizzaModule::Parmesan.new pizza
    when 'mozzarella'
      PizzaModule::Mozzarella.new pizza
    when 'pineapple'
      PizzaModule::Pineapple.new pizza
    when 'mushroom'
      PizzaModule::Mushroom.new pizza
    end
  end

end
