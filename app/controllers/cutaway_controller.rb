class CutawayController < ApplicationController
  before_action :destroy_user_session_if_doctor!

  def index
    puts current_superuser
    puts current_user
    puts current_doctor
  end

  private 

  def destroy_user_session_if_doctor!
    sign_out(current_user) if doctor_signed_in?
  end
end
