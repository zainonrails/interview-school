class Student < ApplicationRecord
  has_many :student_sections
  has_many :sections, through: :student_sections
end