class CreateStudentSections < ActiveRecord::Migration[6.0]
  def change
    create_table :student_sections do |t|
      t.references :section
      t.references :student
    end
  end
end
