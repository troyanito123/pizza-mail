class AddUserToPizza < ActiveRecord::Migration[6.0]
  def change
    add_reference :pizzas, :user, null: true, foreign_key: true
  end
end
