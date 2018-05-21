class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :company, foreign_key: true
      t.references :gazelle_runner, foreign_key: true
      t.integer :cost_per_hour
      t.integer :task_time
      t.references :task_category, foreign_key: true
      t.references :pick_up_location
      t.references :drop_off_location

      t.timestamps
    end
  end
end
