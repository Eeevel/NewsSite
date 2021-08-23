# Preview all emails at http://localhost:3000/rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview
  def send_subscription_email
    SubscriptionMailer
      .with(subscription: Subscription.new(user: User.new(email: 'user@user', first_name: 'User', last_name: '123456'),
                                           parameter: :category,
                                           name: 'People',
                                           frequency: :daily))
      .send_subscription_email
  end
end
