class AlarmsController < ApplicationController
	before_action :set_alarm, only: [:upvote]

  # POST /alarms
  # POST /alarms.json
  def create
    @alarm = Alarm.new(alarm_params)

    respond_to do |format|
      if @alarm.save
        format.html { redirect_to root_path, notice: 'SUCCESSFULLY ALERTED!!!' }
      else
        format.html { redirect_to root_path, :flash => { :error => @alarm.errors.full_messages.join(', ') } }
      end
    end
  end

  def upvote
  	@alarm.upvote
  	redirect_to root_path, notice: 'Alarm was successfully upvoted.'
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
