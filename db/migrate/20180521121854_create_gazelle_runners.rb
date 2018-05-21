class CreateGazelleRunners < ActiveRecord::Migration[5.1]
  def change
    create_table :gazelle_runners do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
