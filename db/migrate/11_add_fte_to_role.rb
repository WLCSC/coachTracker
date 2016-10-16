class AddFteToRole < ActiveRecord::Migration
  def change
    add_column :roles, :fte, :float, null: false
  end
end
