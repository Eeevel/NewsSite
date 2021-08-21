class UserPresenter
  def initialize(user)
    @user = user
  end

  def large_avatar
    @user.avatar.url(:large)
  end

  def small_avatar
    @user.avatar.url(:thumb)
  end

  def birth_date
    @user.date_of_birth.strftime('%d %B, %Y')
  end
end
