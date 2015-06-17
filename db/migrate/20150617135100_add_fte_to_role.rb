class AddFteToRole < ActiveRecord::Migration
  def change
    add_column :roles, :fte, :integer
  end
end
