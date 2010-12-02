class AddRestrictionToPathway < ActiveRecord::Migration
  def self.up
    add_column :pathways, :restriction, :string
  end

  def self.down
    remove_column :pathways, :restriction
  end
end
