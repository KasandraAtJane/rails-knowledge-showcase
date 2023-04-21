class AppointmentsController < ApplicationController
  def new
    @appointments = Appointment.all
  end

  def index
    @appointments = Appointment.all

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

  # def request; end
  # def response; end
end
