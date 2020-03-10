class SendReportJob < ApplicationJob
  queue_as :default

  def perform(id_report)
    report = Report.find(id_report)
    pizzas = Pizza.prevalence(report.prevalence)
    PizzaMailer.send_report(pizzas, report.email, report.prevalence).deliver
    report.done!
  end
end
