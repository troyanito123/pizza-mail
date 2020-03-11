desc "send daily reports"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.daily
  reports.each do |report|
    time = report.time
    report.time = time + 1.day
    if report.save
      SendReportJob.set(wait_until: time).perform_later(report.id)
      report.queue!
    end
  end
  puts "done."
end

desc "send weekly reports"
task :send_report_weekly => :environment do
  puts "Sending report..."
  reports = Report.on.weekly
  reports.each do |report|
    day = report.day
    if day.today?
      time = report.time
      report.day = day + 1.week
      report.time = time + 1.week
      if report.save
        SendReportJob.set(wait_until: time).perform_later(report.id)
        report.queue!
      end
    end
  end
  puts "done."
end

desc "send monthly reports"
task :send_report_monthly => :environment do
  puts "Sending report..."
  reports = Report.on.monthly
  reports.each do |report|
    day = report.day
    if day.today?
      time = report.time
      report.day = day.next_month
      report.time = time + 1.month
      if report.save
        SendReportJob.set(wait_until: time).perform_later(report.id)
        report.queue!
      end
    end
  end
  puts "done."
end

desc "send customs reports"
task :send_report_custom => :environment do
  puts "Sending report..."
  reports = Report.on.custom
  today = Time.current.utc.strftime('%^A')
  reports.each do |report|
    days = report.days
    days.each do |day|
      time = report.time
      report.time = time + 1.day
      if (report.save && day.eql?(today))
        SendReportJob.set(wait_until: time).perform_later(report.id)
        report.queue!
      end
    end
  end
  puts "done."
end
