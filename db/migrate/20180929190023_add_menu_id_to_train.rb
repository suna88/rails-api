class AddMenuIdToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :menu_id, :integer
  end
end
