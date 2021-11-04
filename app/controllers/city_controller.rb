# frozen_string_literal: true

class CityController < ApplicationController
  require 'gossip'

  def index; end

  def show
    @city = City.find(params[:id])
    @users = User.where(city_id: params[:id])
    @gossips = find_gossip(@users)
  end

  private

  def find_gossip(array)
    find_gossip = []
    array.each do |user|
      find_gossip << Gossip.find_by(user: user)
    end
    find_gossip.compact
  end
end
