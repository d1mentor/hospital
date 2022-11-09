class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def profile
    @appointments = Appointment.where(doctor_id: current_doctor.id).order(active: :desc).order(desired_time: :desc)
  end
end
