class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :class_room
      t.references :teacher
      t.references :subject
      t.time :start_time
      t.time :end_time
      t.integer :days
    end
  end
end
