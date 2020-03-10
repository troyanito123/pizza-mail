module ReportHelper

  def create_days(custom_days)
    custom_days.collect { |day| Day.find_by(code: day) }
  end

end
