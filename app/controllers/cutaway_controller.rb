class CutawayController < ApplicationController
  def index
    puts current_superuser
    puts current_user
    puts current_doctor
  end
end
