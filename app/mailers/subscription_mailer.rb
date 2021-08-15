class SubscriptionMailer < ApplicationMailer
  def send_subscription_email
    subscription = params[:subscription]
    @user = subscription.user
    @articles = Article.order('updated_at DESC').where(status: :published)
    @articles = select_by_date(subscription, @articles)
    @articles = select_by_parameter(subscription, @articles)
    mail(to: @user.email, subject: 'Subscription email')
  end

  private

  def select_by_date(subscription, articles)
    case subscription.frequency
    when 'daily'
      articles.where(created_at: Date.today - 1...Date.today)
    when 'every_two_days'
      articles.where(created_at: Date.today - 2...Date.today)
    else
      articles.where(created_at: Date.today - 7...Date.today)
    end
  end

  def select_by_parameter(subscription, articles)
    case subscription.parameter
    when 'category'
      articles.where(category: subscription.name.downcase)
    when 'tag'
      tag = Tag.find_by(name: subscription.name)
      articles = tag.articles.order('updated_at DESC').where(status: :published)
      select_by_date(subscription, articles)
    else
      articles.where(region: subscription.name.capitalize)
    end
  end
end
