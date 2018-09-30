class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :type
      t.integer :count
      t.integer :set

      t.timestamps
    end
  end
end
