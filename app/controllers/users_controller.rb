class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      if user.courses.present?
        redirect_to assignments_path
      else
        redirect_to courses_path
      end
    else
      redirect_to :root
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
