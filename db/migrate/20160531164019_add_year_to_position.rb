class AddYearToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :year_id, :integer
  end
end
