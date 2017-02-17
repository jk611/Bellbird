class AlarmsController < ApplicationController
  # POST /alarms
  # POST /alarms.json
  def create
    @alarm = Alarm.new(alarm_params)

    respond_to do |format|
      if @alarm.save
        format.html { redirect_to root_path, notice: 'Alarm was successfully created.' }
        format.json { render :show, status: :created, location: @alarm }
      else
        format.html { render :new }
        format.json { render json: @alarm.errors, status: :unprocessable_entity }
      end
    end
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_alarm
    @alarm = Alarm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def alarm_params
    params.require(:alarm).permit(:content)
  end
end
