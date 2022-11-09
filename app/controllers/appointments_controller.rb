class AppointmentsController < ApplicationController
  before_action :authenticate_doctor!, only: %i[new_recomendation create_recomdendation]
  before_action :authenticate_user!, only: %i[new create show edit update delete destroy]

  def new
    @appointment = Appointment.new
    @doctor = Doctor.find_by(id: params[:doctor_id])
    @doctor_info = @doctor.category.name + ' ' + @doctor.name
  end

  def create
    @appointment = Appointment.new(new_appointment_params)

    @appointment.save if Appointment.where(doctor_id: params[:doctor_id], active: true).count < 10
    redirect_to '/users/profile'
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def new_recomendation
    @appointment = Appointment.find_by(id: params[:id])
  end

  def create_recomendation
    @appointment = Appointment.find_by(id: appointment_feedback_params[:id])
    @appointment.update(recomendation: appointment_feedback_params[:recomendation], active: false)
    redirect_to '/doctors/profile'
  end

  private

  def appointment_feedback_params
    params.require(:appointment).permit(:id, :user_id, :doctor_id, :recomendation)
  end

  def new_appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :complaint, :desired_time)
  end
end
