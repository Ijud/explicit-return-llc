class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :cohort_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
