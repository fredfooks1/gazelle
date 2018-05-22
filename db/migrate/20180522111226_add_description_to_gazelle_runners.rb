class AddDescriptionToGazelleRunners < ActiveRecord::Migration[5.1]
  def change
    add_column :gazelle_runners, :description, :string
  end
end
