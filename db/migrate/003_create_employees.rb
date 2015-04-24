class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string     :name,      null: false
      t.references :position,  null: false, index: true
      t.references :company,   null: false, index: true
      t.timestamps             null: false
    end

    add_foreign_key :employees, :positions
    add_foreign_key :employees, :companies
  end

  def self.down
    drop_table :employees
  end
end
