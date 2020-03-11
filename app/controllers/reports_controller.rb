class ReportsController < ApplicationController

  include ReportHelper
  before_action :set_days, only: [:new, :create, :edit, :update, :custom_prevalence]

  DAYS = [
      {:code => 'MONDAY', :name => 'Monday'},
      {:code => 'TUESDAY', :name => 'Tuesday'},
      {:code => 'WEDNESDAY', :name => 'Wednesday'},
      {:code => 'THURSDAY', :name => 'Thursday'},
      {:code => 'FRIDAY', :name => 'Friday'},
      {:code => 'SATURDAY', :name => 'Saturday'},
      {:code => 'SUNDAY', :name => 'Sunday'},
  ].freeze

  def index
    @reports = Report.all.order("created_at ASC")
  end

  def new
    report
  end

  def create
    if report.save
      flash[:success] = I18n.t 'report.create'
      redirect_to reports_path
    else
      render :new
    end
  end

  def edit
    report
  end

  def update
    report.assign_attributes report_params
    report.days = nil unless report.custom?
    if report.save
      flash[:success] = I18n.t 'report.update'
      redirect_to reports_path
    else
      render :edit
    end
  end

  def destroy
    report.destroy
    flash.now[:danger] = I18n.t 'report.destroy'
  end

  def report_on
    report.state = true
    render :index unless report.save
    # unless report.save
    #   render :index
    # end
  end

  def report_off
    report.state = false
    render :index unless report.save
  end

  def custom_prevalence
    @prevalence = params[:prevalence]
    if params.include?(:id)
      report
    else
      @report = Report.new
    end
  end

  private

  def report_params
    params.require(:report).permit(:day, :prevalence, :time, :email, days: [])
  end

  def report
    @report ||=
        case action_name
        when 'new'
          Report.new
        when 'create'
          Report.new(report_params)
        else
          Report.find_by(id: params[:id])
        end
  end

  def set_days
    @days = DAYS
  end

end
