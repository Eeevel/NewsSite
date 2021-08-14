class SubscriptionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @subscriptions = @user.subscriptions.order('updated_at DESC')
    authorize @subscriptions
  end

  def new
    @subscription = Subscription.new
    @user = User.find(params[:user_id])
    @subscription.user = @user
    authorize @subscription
  end

  def create
    @user = User.find(params[:user_id])
    @subscription = Subscription.new(subscription_params)
    @subscription.user = @user
    authorize @subscription

    if @subscription.save
      redirect_to user_subscriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription = User.find(params[:user_id]).subscriptions.find(params[:id])
    authorize @subscription
    @subscription.destroy

    redirect_to user_subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:parameter, :name, :frequency)
  end
end
