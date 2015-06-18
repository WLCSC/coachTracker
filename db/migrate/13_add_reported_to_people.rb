class AddReportedToPeople < ActiveRecord::Migration
  def change
    add_column :positions, :reported, :boolean, null: false, default: false
  end
end
