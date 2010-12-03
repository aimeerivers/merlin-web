class AddFatalWithoutItemToPathway < ActiveRecord::Migration
  def self.up
    add_column :pathways, :fatal_without_item, :boolean, default: false
    execute "UPDATE pathways SET fatal_without_item = false"
  end

  def self.down
    remove_column :pathways, :fatal_without_item
  end
end
