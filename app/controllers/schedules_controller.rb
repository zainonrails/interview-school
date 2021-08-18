class SchedulesController < ApplicationController
  def create
    res = ::Schedules::ScheduleCreator.call(schedule_params, current_user)
    notice = if res.error
              { notice: 'Cannot add section due to conflict' }
            else
              { notice: 'Section added successfully' }
             end

    redirect_to sections_path, notice
  end

  def destroy
    StudentSection.destroy(params[:id])
    redirect_to sections_path, notice: 'Successfully removed section.'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:section_id)
  end
end
