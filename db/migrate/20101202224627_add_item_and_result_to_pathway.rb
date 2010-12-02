class AddItemAndResultToPathway < ActiveRecord::Migration
  def self.up
    add_column :pathways, :item, :string
    add_column :pathways, :result, :string
  end

  def self.down
    remove_column :pathways, :result
    remove_column :pathways, :item
  end
end
