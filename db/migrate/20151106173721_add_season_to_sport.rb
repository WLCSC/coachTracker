class AddSeasonToSport < ActiveRecord::Migration
  def change
    add_column :sports, :season_id, :integer
  end
end
