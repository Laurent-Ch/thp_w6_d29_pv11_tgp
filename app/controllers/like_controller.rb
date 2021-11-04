class LikeController < ApplicationController
  before_action :find_like, only: [:destroy]

  def new
    @like = Like.new
  end

  def create; end

  def update; end

  def destroy
    # if !(already_liked?)
    #   flash[:notice] = "Cannot unlike"
    # else
    @like.destroy
    # end
    redirect_to gossip_path(@gossip)
  end

  def edit; end

  private

  # def already_liked?
  #   Like.where(user: current_user, gossip_id: params[:id]).exists?
  # end

  def find_like
    @like = @gossip.likes.find(params[:id])
  end
end
