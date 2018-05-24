class AddCoordinatesToGazelleRunners < ActiveRecord::Migration[5.1]
  def change
    add_column :gazelle_runners, :latitude, :float
    add_column :gazelle_runners, :longitude, :float
  end
end
