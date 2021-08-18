class Section < ApplicationRecord
  enum days: %i[mwf tt d]
  has_many :student_sections
  has_many :students, through: :student_sections
  belongs_to :teacher
  belongs_to :class_room
  belongs_to :subject

  VALID_DAYS_MAPPING = { mwf: 'tt', tt: 'mwf', d: nil }.freeze

  # assumes that there is a conflict in time and verifies if
  # there is a conflict within days
  def self.verify_days(existing_sec, new_sec, t_conflict)
    t_conflict ? VALID_DAYS_MAPPING[existing_sec.days.to_sym] != new_sec.days : false
  end
end