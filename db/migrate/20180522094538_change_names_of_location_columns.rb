class ChangeNamesOfLocationColumns < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tasks, :drop_off_location
    add_reference :tasks, :first_location

    remove_reference :tasks, :pick_up_location
    add_reference :tasks, :second_location
  end
end
