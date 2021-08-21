class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = SortCommentsService.call(params[:sort], @user)
    @pagy, @viewings = pagy(@user.viewings.order('updated_at DESC'), items: 10)
  end
end
