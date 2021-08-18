module Schedules
  class ScheduleCreator
    attr_accessor :params, :current_user, :error

    def initialize(new_section_params, current_user)
      self.params = new_section_params
      self.current_user = current_user
      self.error = false
    end

    def self.call(new_section_params, current_user)
      obj = new(new_section_params, current_user)
      obj.call
      obj
    end

    def call
      add_section_to_schedule if empty_schedule?

      new_sec = Section.find(params[:section_id])
      current_user.sections.each do |sec|
        if conflict?(new_sec, sec)
          self.error = true
          break
        end
      end
      add_section_to_schedule unless self.error
    end

    private

    def empty_schedule?
      current_user.student_sections.blank?
    end

    def conflict?(new_sec, sec)
      t_conflict = time_conflict?(new_sec, sec)
      day_conflict?(new_sec, sec, t_conflict)
    end

    def time_conflict?(new_sec, existing_sec)
      new_sec.start_time.between?(existing_sec.start_time, existing_sec.end_time) ||
        new_sec.end_time.between?(existing_sec.start_time, existing_sec.end_time)
    end

    def day_conflict?(new_sec, existing_sec, t_conflict)
      Section.verify_days(existing_sec, new_sec, t_conflict)
    end

    def add_section_to_schedule
      StudentSection.create(params.merge(student_id: current_user.id))
    end
  end
end