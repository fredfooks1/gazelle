class AddStateToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :state, :string
  end
end
