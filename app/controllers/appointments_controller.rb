class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @appointment }
    end
  end

  def index
    @appointments = Appointment.all
    #add staff member and patient == user
    # render json: @appointments.to_json

    respond_to do |format|
      format.html
      format.json { render :index }
    end

    # transform into json
    # Google: turn active record relation into json
  end

  def import
    file = params[:file]
    return redirect_to appointments_path, notice: 'File type must be CSV' unless file.content_type == 'text/csv'

    CsvImportAppointmentsService.new.call(file)
    redirect_to appointments_path, notice: 'Appointments imported!'
  end

  def destroy
    @appointments = Appointment.all
  end
end
