class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash.now.alert = "Sign up successful"
      if user.courses.present?
        redirect_to assignments_path
      else
        redirect_to courses_path
      end
    else
      flash.now.alert = "Your email and password do not match"
      redirect_to :root
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end

end
