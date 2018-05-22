class CreateGazelleCapabilityLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :gazelle_capability_logs do |t|
      t.references :gazelle_runner, foreign_key: true
      t.references :task_category, foreign_key: true

      t.timestamps
    end
  end
end
