class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.order('updated_at DESC')
  end
end
