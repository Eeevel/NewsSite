class SortCommentsService < ApplicationService
  attr_reader :sort, :user

  def initialize(sort, user)
    @sort = sort
    @user = user
  end

  def call
    case @sort
    when 'body_desc'
      @user.comments.order('body DESC')
    when 'updated_at_desc'
      @user.comments.order('updated_at DESC')
    else
      @user.comments.order(@sort)
    end
  end
end
