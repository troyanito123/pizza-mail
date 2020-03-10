class ReportsController < ApplicationController

  include ReportHelper

  before_action :set_days, only: [:custom_prevalence, :create]
  before_action :set_report, only: [:report_off, :report_on, :destroy]

  def index
    @reports = Report.all.includes(:days)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if params.include?(:custom)
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
    @report.destroy
    flash.now[:danger] = I18n.t 'report.destroy'
  end

  def report_on
    @report.state = true
    unless @report.save
      render :index
    end
  end

  def report_off
    @report.state = false
    unless @report.save
      render :index
    end
  end

  def custom_prevalence
    @prevalence = params[:prevalence]
  end

  private
    def report_params
      params.require(:report).permit(:day, :prevalence, :time, :email)
    end

    def set_days
      @days = Day.all
    end

    def set_report
      @report ||= Report.find(params[:id])
    end
end
