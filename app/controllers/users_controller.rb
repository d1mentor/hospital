class UsersController < ApplicationController
  def doctors_list
    @doctors = Doctor.all.sort_by { |doc| doc.category.name }
  end

  def profile
    @appointments = Appointment.where(user_id: current_user.id).order(active: :desc).order(desired_time: :desc)
  end
end
