class PizzasController < ApplicationController

  include PizzasHelper

  before_action :set_default_pizza, only: [:new]

  def new
    @ingredients = Ingredient.all
    @sizes = Size.all
  end

  def index
    @pizzas = current_user.pizzas.includes(:ingredients)
  end

  def create
    pizza = Pizza.new(cost: current_cost, name: current_name)
    pizza.user = current_user
    pizza.size = Size.find_by(code: current_size)
    pizza.ingredients = get_ingredients
    if pizza.save
      SendOrderJob.set(wait: 1.minute).perform_later(current_user.id, pizza.id)
      flash[:success] = I18n.t 'pizza.create'
      redirect_to new_pizza_path
    else
      flash[:danger] = I18n.t 'pizza.error.create'
      redirect_to new_pizza_path
    end
  end

  def preview
    if current_ingredients.empty?
      flash[:danger] = I18n.t 'pizza.error.ingredient'
      redirect_to new_pizza_path
    end
  end

  def add_ingredient
    current_ingredients << type
    save_changes_on_pizza
  end

  def remove_ingredient
    current_ingredients.delete(type)
    save_changes_on_pizza
  end

  def change_size
    @old_size = current_size
    save_size(size)
    save_changes_on_pizza
  end

  private

  def set_default_pizza
    save_cost(10)
    save_size('small')
    save_ingredients([])
  end

  def type
    @type = params[:type]
  end

  def size
    @size = params[:size]
  end

end
