class SessionController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new; end

  def create
    user = User.find_by(email: params[:user_email])

    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      redirect_to root_path, success: 'Bienvenue !'

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
