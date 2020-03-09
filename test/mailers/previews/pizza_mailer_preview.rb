# Preview all emails at http://localhost:3000/rails/mailers/pizza_mailer
class PizzaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pizza_mailer/send_order
  def send_order
    PizzaMailer.send_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/pizza_mailer/send_report
  def send_report
    PizzaMailer.send_report
  end

end
