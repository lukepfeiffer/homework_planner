class UsersController < ApplicationController
  expose :user

  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      redirect_to assignments_path
    else
      redirect_to :root
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to assignments_path
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :text_alerts,
      :phone_number,
      :filepicker_url
    )
  end
end
