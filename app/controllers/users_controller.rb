class UsersController < ApplicationController
  def doctors_list
    @doctors = Doctor.all
  end

  def profile
    @appointments = Appointment.where(user_id: current_user.id)
  end
end
