class AddSportToRole < ActiveRecord::Migration
  def change
    add_reference :roles, :sport, index: true, foreign_key: true
  end
end
