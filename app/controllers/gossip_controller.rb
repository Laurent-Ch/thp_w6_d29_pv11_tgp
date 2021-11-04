# frozen_string_literal: true

class GossipController < ApplicationController
  before_action :authenticate_user, only: %i[new create]
  before_action :check_user, only: %i[edit update destroy]

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: session[:user_id])
    if @gossip.save
      redirect_to gossip_path(@gossip.id), success: 'Gossip validé !'
    else
      flash.now[:danger] = 'Retente ta chance !'
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip_title], content: params[:gossip_content], user_id: session[:user_id])
      redirect_to gossip_path(@gossip.id), success: 'Gossip validé !'
    else
      flash[:danger] = 'Retente ta chance !'
      render :edit, status: :unprocessable_entity
      flash.discard
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  def like
    @gossip = Gossip.all.find(params[:id])
    Like.create(user_id: current_user.id, gossip_id: @gossip.id)
    redirect_to root_path
  end

  private

  def check_user
    unless current_user == Gossip.find(params[:id]).user
      flash[:danger] = "Vous n'avez pas cette autorisation."
      redirect_to root_path
    end
  end
end
