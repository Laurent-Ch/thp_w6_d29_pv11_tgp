# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success
  include SessionHelper

  private

  def authenticate_user
    unless current_user
      flash[:danger] = 'Allez hop, on se connecte.'
      redirect_to new_session_path
    end
  end
end
