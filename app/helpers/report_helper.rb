module ReportHelper

  def days(custom_days)
    custom_days.delete("")
    custom_days.collect { |day| Day.find(day) }
  end

end
