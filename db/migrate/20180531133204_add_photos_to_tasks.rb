class AddPhotosToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :photo, :string
  end
end
