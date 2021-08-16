class ReportMailer < ApplicationMailer
  def send_report_email
    report = params[:report]
    @user = report.user
    @articles = Article.order('updated_at DESC')
                       .where(status: :published,
                              created_at: report.start_date...report.end_date)
    mail(to: @user.email, subject: 'Report email')
  end
end
