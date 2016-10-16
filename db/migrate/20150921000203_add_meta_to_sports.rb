class AddMetaToSports < ActiveRecord::Migration
  def change
    add_column :sports, :season, :string
    add_column :sports, :group, :string
  end
end
