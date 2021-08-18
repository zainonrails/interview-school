module SchedulesHelper
  def day_full_form(day)
    case day
    when 'mwf'
      'Monday, Wednesday, Friday'
    when 'tt'
      'Tuesday, Thursday'
    when 'd'
      'Daily'
    end
  end

  def format_time(time)
    time.strftime('%T %P')
  end
end
