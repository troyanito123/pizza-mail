class PizzaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pizza_mailer.send_order.subject
  #
  def send_order(user, pizza)
    @user = user
    @pizza = pizza
    @ingredients = @pizza.ingredients

    mail to: user.email, subject: "Your #{@pizza.name} will arrive in 45 minutes"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pizza_mailer.send_report.subject
  #
  def send_report(pizzas, email)
    @pizzas = pizzas
    mail to: email, subject: "Report of day: #{Time.now.strftime("%Y-%m-%d")}"
  end
end
