class ReportJob
  def send_report(email, id_report, prevalence)
    case prevalence
    when 'daily'
      pizzas = Pizza.daily
    when 'monthly'
      pizzas = Pizza.monthly
    when 'weekly'
      pizzas = Pizza.weekly
    end
    report = Report.find(id_report)
    PizzaMailer.send_report(pizzas, email).deliver
    report.done!
  end
end