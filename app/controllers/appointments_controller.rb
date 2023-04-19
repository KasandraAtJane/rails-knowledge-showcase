class AppointmentsController < ApplicationController
  def new; end

  def import
    file = params[:file]
    return redirect_to appointments_path, notice: 'File type must be CSV' unless file.content_type == 'text/csv'

    CsvImportAppointmentsService.new.call(file)
    redirect_to appointments_path, notice: 'Appointments imported!'
  end

  def create; end

  def destroy; end

  def index
    @appointments = Appointment.all
  end
end
