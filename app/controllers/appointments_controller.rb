class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_current_user, only: [:index]

  # load_and_authorize_resource

  def new
    @appointments = Appointment.all
    puts "Current User: #{current_user.inspect}"
    puts "Appointments: #{@appointments.inspect}"
  end

  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @appointment }
    end
  end

  def index
    puts "Current User: #{current_user.inspect}"
    puts "Appointments: #{@appointments.inspect}"

    if current_user.role == 'staff_member'
      staff_member_id = params[:staff_member].to_i
      @appointments = current_user.staff_member_appointments
    elsif current_user.role == 'super'
      @appointments = Appointment.all
    elsif current_user.role == 'patient'
      @appointments = current_user.patient_appointments
    else
      redirect_to new_user_session_path, notice: 'You do not have any upcoming appointments'
    end
  
    # render json: @appointments.to_json
  end

  def import
    file = params[:file]
    return redirect_to appointments_path, notice: 'File type must be CSV' unless file.content_type == 'text/csv'

    CsvImportAppointmentsService.new.call(file)
    redirect_to appointments_path, notice: 'Appointments imported!'
  end

  def destroy
    # @appointments = Appointment.all
  end
end
