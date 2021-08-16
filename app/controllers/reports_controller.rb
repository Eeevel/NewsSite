class ReportsController < ApplicationController
  def new
    @report = Report.new
    authorize @report
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    authorize @report

    if @report.save
      ReportMailer.with(report: @report).send_report_email.deliver_now

      flash[:notice] = 'Report sent to email'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:start_date, :end_date)
  end
end
