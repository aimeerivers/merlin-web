class CreatePathways < ActiveRecord::Migration
  def self.up
    create_table :pathways do |t|
      t.string :from
      t.string :direction
      t.string :going_to
    end
  end

  def self.down
    drop_table :pathways
  end
end
