class SubscriptionMailerDailyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Subscription.where(frequency: 'daily').to_a.each do |subscription|
      SubscriptionMailer.with(subscription: subscription).send_subscription_email.deliver_now
    end
  end
end
