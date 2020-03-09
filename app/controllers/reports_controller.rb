class ReportsController < ApplicationController

  include ReportHelper

  def index
    @reports = Report.all.includes(:days)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    prevalence = params[:report][:prevalence].to_i
    @report.prevalence = prevalence

    if @report.custom? && params.include?("custom")
      @report.days = create_days(params[:custom][:days])
    end

    if @report.save
      flash[:success] = I18n.t 'report.create'
      redirect_to reports_path
    else
      render :new
    end
  end

  def destroy
    report = Report.find(params['id'])
    @id = report.id
    report.destroy
  end

  def report_on
    @id = params['id']
    @report = Report.find(@id)
    @report.state = true
    unless @report.save
      render :index
    end
  end

  def report_off
    @id = params['id']
    @report = Report.find(@id)
    @report.state = false
    unless @report.save
      render :index
    end
  end

  def custom_prevalence
    @prevalence = params['prevalence']
    @days = Day.all
  end

  private

  def report_params
    params.require(:report).permit(:day, :time, :email)
  end
end
