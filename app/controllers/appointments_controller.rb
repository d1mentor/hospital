class AppointmentsController < ApplicationController
  before_action :authenticate_doctor!, only: [:new_recomendation, :create_recomdendation]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :delete, :destroy]

  def new
    @appointment = Appointment.new
    @doctor = Doctor.find_by(id: params[:doctor_id])
    @doctor_info = @doctor.category.name + " " + @doctor.name
  end

  def create
    @appointment = Appointment.new(new_appointment_params)
    @appointment.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def new_recomendation
  end
  
  def create_recomdendation
  end  

  private
  def appointment_feedback_params
    params.require(:appointment).permit(:id, :user_id, :doctor_id, :recomendation)
  end
  
  def new_appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :complaint, :desired_time)
  end
end
