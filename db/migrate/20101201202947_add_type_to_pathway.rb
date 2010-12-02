class AddTypeToPathway < ActiveRecord::Migration
  def self.up
    add_column :pathways, :type, :string
    execute "UPDATE pathways SET type = 'Pathway'"
  end

  def self.down
    remove_column :pathways, :type
  end
end
