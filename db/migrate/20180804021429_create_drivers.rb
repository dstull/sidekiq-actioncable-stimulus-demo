class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.belongs_to :car, foreign_key: true

      t.timestamps
    end
  end
end
