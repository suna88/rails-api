class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :user_id
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
