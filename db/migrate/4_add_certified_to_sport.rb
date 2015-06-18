class AddCertifiedToSport < ActiveRecord::Migration
  def change
    add_column :sports, :certified, :boolean, null: false, default: true
  end
end
