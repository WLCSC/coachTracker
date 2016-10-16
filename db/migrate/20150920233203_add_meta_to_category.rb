class AddMetaToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :rank, :string
    add_column :categories, :counted, :boolean, default: true
  end
end
