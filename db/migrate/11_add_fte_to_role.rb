class AddFteToRole < ActiveRecord::Migration
  def change
    add_column :roles, :fte, :integer, null: false
  end
end
