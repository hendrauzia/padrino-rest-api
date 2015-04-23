class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name,    null: false
      t.text   :address, null: false
      t.string :city,    null: false
      t.string :country, null: false
      t.string :email
      t.string :phone
      t.timestamps       null: false
    end
  end

  def self.down
    drop_table :companies
  end
end
