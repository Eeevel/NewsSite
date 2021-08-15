class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = case params[:sort]
                when 'body_desc'
                  @user.comments.order('body DESC')
                when 'updated_at_desc'
                  @user.comments.order('updated_at DESC')
                else
                  @user.comments.order(params[:sort])
                end
    @pagy, @viewings = pagy(@user.viewings.order('updated_at DESC'), items: 10)
  end
end
