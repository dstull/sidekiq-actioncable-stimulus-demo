class AddDriverChangesToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :driver_changes, :integer, default: 0
  end
end
