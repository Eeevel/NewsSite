# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview
  def send_report_email
    ReportMailer.with(report: Report.new(user: User.new(email: 'admin@admin', first_name: 'Admin', last_name: '123456'),
                                         start_date: '2021-07-20',
                                         end_date: '2021-08-15')).send_report_email
  end
end
