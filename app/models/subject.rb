class Subject < ApplicationRecord
  has_many :teacher_subjects, dependent: :destroy
  has_many :teachers, through: :teacher_subjects
  has_many :sections
  accepts_nested_attributes_for :teacher_subjects, allow_destroy: true

  validates :name, presence: true
end
