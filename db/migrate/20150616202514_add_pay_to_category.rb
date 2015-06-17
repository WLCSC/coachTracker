class AddPayToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :pay, :integer
  end
end
