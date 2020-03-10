class ReportsController < ApplicationController

  include ReportHelper

  before_action :set_days, only: [:custom_prevalence, :create, :edit]
  before_action :set_report, only: [:report_off, :report_on, :destroy, :edit, :update]

  def index
    @reports = Report.all.includes(:days)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if params.include?(:custom)
      @report.days = days(params[:custom][:days])
    end
    if @report.save
      flash[:success] = I18n.t 'report.create'
      redirect_to reports_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @report.assign_attributes report_params
    if params.include?(:custom)
      @report.days = days(params[:custom][:days])
    else
      # DESTROY RELATION WITH REPORT_DAY
    end
    if @report.save
      flash[:success] = I18n.t 'report.update'
      redirect_to reports_path
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    flash.now[:danger] = I18n.t 'report.destroy'
  end

  def report_on
    report.state = true
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
    p "#### #{params}"
    @prevalence = params[:prevalence]
    if params.include?(:report)
      @report = Report.find(params[:report])
    else
      @report = Report.new
    end
  end

  private
    def report_params
      params.require(:report).permit(:day, :prevalence, :time, :email)
    end

    def set_days
      @days = Day.all
    end

    def report
      @report ||= Report.find_by(id: params[:id])
    end

end
