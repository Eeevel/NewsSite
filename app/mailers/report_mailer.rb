class ReportMailer < ApplicationMailer
  def send_report_email
    report = params[:report]
    @user = report.user
    @articles = Article.order('updated_at DESC')
                       .where(status: :published,
                              created_at: report.start_date...report.end_date)
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('reports/report.html.erb')
    )
    attachments['Report.pdf'] = pdf
    mail(to: @user.email, subject: 'Report email')
  end
end
