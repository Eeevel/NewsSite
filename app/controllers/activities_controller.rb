class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order('updated_at DESC')
    @pagy, @viewings = pagy(@user.viewings.order('updated_at DESC'), items: 10)
  end
end
