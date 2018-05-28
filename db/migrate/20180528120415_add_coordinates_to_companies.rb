class AddCoordinatesToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :latitude, :float
    add_column :companies, :longitude, :float
    add_column :companies, :address, :string
  end
end
