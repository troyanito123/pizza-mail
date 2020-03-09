class PizzasController < ApplicationController

  include PizzasHelper

  def new
    @ingredients = Ingredient.all
    @sizes = Size.all
    save_cost(10)
    save_size('small')
    save_ingredients([])
  end

  def preview
    if current_ingredients.size == 0
      flash[:danger] = I18n.t 'pizza.error.ingredient'
      redirect_to pizza_path
    end
  end

  def create

    # refactor?
    name = "Pizza #{current_size} with #{current_ingredients.first} and #{current_ingredients.last}"
    pizza = Pizza.new(cost: current_cost, name: name)
    pizza.user = current_user
    pizza.size = Size.find_by(code: current_size)
    pizza.ingredients = get_ingredients
    if pizza.save
      SendOrderJob.set(wait: 1.minute).perform_later(current_user.id, pizza.id)
      flash[:success] = I18n.t 'pizza.create'
      redirect_to pizza_path
    else
      flash[:danger] = I18n.t 'pizza.error.create'
      redirect_to pizza_path
    end
  end

  def my_pizzas
    @pizzas = User.find(current_user.id).pizzas.includes(:ingredients)
  end

  def add_ingredient
    @type =  params[:type]
    current_ingredients << @type
    pizza = create_pizza
    save_cost(pizza.get_cost(current_size))
  end

  def remove_ingredient
    @type = params[:type]
    current_ingredients.delete(@type)
    pizza = create_pizza
    save_cost(pizza.get_cost(current_size))
  end

  def change_size
    @old_size = current_size
    @size = params[:size]
    save_size(@size)
    pizza = create_pizza
    save_cost(pizza.get_cost(current_size))
  end



end
