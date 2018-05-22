class AddPhotosToGazelleRunners < ActiveRecord::Migration[5.1]
    def change
    add_column :gazelle_runners, :photo, :string
   end
end


