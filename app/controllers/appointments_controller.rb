class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  def index
    @appointments = Appointment.all
  end

  def show
    appointment = Appointment.includes(:user, :doctor).all.find(params[:id])
    render json: appointment
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    appointment = CreateAppointmentsService.call(user_id: params[:user_id], doctor_id: params[:doctor_id])
    render json: appointment, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: e.record.errors, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: e.record.errors, status: :unprocessible_entity
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_path, status: :see_other, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:date, :doctor_id, :user_id)
    end
end
