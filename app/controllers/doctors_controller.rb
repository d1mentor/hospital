class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  load_and_authorize_resource

  def profile
    @appointments = Appointment.where(doctor_id: current_doctor.id).order(active: :desc).order(desired_time: :desc)
  end

  private

  # Удалить сессию пользователя если доктор залогнен
end
