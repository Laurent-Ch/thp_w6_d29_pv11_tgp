class SessionController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new; end

  def create
    user = User.find_by(email: params[:user_email])

    if user && user.authenticate(params[:user_password])
      log_in(user)
      remember(user)
      redirect_to root_path, success: 'Bienvenue !'

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # session.delete(:user_id)
    user = current_user
    log_out(user)
    redirect_to root_path
  end
end
