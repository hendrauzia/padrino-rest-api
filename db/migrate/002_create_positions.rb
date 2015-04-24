class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :name, null: false
      t.timestamps    null: false
    end
  end

  def self.down
    drop_table :positions
  end
end
