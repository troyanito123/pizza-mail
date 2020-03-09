class AddNameToPizzas < ActiveRecord::Migration[6.0]
  def change
    add_column :pizzas, :name, :string
  end
end
