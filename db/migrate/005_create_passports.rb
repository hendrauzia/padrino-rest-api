class CreatePassports < ActiveRecord::Migration
  def self.up
    create_table :passports do |t|
      t.references :employee, null: false, index: true
      t.references :upload,   null: false, index: true
      t.timestamps
    end

    add_foreign_key :passports, :employees
    add_foreign_key :passports, :uploads
  end

  def self.down
    drop_table :passports
  end
end
