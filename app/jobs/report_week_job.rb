class ReportWeekJob < ApplicationJob
  queue_as :default

  def perform(email, id_report)
    pizzas = Pizza.weekly
    report = Report.find(id_report)
    PizzaMailer.send_report(pizzas, email).deliver
    report.done!
  end
end
