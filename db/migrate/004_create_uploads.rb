class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.text :file,           null: false
      t.timestamps            null: false
    end
  end

  def self.down
    drop_table :uploads
  end
end
