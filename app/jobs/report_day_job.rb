class ReportDayJob < ApplicationJob
  queue_as :default

  #include ReportJob

  def perform(email, id_report)
    pizzas = Pizza.daily
    report = Report.find(id_report)
    PizzaMailer.send_report(pizzas, email).deliver
    report.done!
      # send_report(email, id_report, 'daily')
  end

end
