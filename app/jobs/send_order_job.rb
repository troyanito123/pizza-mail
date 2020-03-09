class SendOrderJob < ApplicationJob
  queue_as :default

  def perform(user_id, pizza_id)
    user = User.find(user_id)
    pizza = Pizza.find(pizza_id)
    PizzaMailer.send_order(user, pizza).deliver
  end
end
