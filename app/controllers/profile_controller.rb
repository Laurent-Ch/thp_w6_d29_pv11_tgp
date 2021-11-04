# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @author = User.find(params[:id])
    @gossips = Gossip.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:user_first_name], last_name: params[:user_last_name],
                     description: params[:user_description], age: params[:user_age], email: params[:user_email], password: params[:user_password], city_id: params[:city])
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path(@user.id), success: 'Ton compte a bien été créé'
    else
      puts @user.inspect
      flash.now[:danger] = 'Désolé, il y a une erreur dans le formulaire !'
      render :new
    end
  end
end
