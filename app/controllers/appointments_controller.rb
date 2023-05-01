class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_current_user, only: [:index]

  # load_and_authorize_resource


  # has_scope :patient, only: :index
  # has_scope :staff_member, only: :index

  def new
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])

    if can?(:patient, @appointment)
      respond_to do |format|
        format.html
        format.json { render json: @appointment }
      end  
    elsif can?(:staff_member, @appointment)
      respond_to do |format|
        format.html
        format.json { render json: @appointment }
      end    
    else    
      redirect_to appointments_path, notice: 'Whoops! You are not authorized to view that appointment'
    end
  end

  def index

    @appointments = Appointment.all

    if params[:patient].present? && can?(:staff_member, Appointment)
      @appointments = @appointments.where(patient_id: params[:patient])
    elsif params[:staff_member].present? && can?(:staff_member, Appointment)
      @appointments = @appointments.where(staff_member_id: params[:staff_member])
    end

    # if current_user.role == 'staff_member'
    #   staff_member_id = params[:staff_member].to_i
    #   @appointments = current_user.staff_member_appointments
    # elsif current_user.role == 'patient'
    #   @appointments = current_user.patient_appointments
    # elsif current_user.role == 'super'
    #   @appointments = Appointment.all 
    # else
    #   redirect_to new_user_session_path, notice: 'You do not have any upcoming appointments'
    # end
  
    respond_to do |format|
      format.html
      format.json { render json: @appointments }
    end
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


