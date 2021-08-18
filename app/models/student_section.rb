class StudentSection < ApplicationRecord
  belongs_to :section
  belongs_to :student
end