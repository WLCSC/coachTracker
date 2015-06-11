class RemoveRoleFromSport < ActiveRecord::Migration
  def change
    remove_reference :sports, :role, index: true, foreign_key: true
  end
end
