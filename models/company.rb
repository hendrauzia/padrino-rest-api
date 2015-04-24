class Company < ActiveRecord::Base
  validates :name, :address, :city, :country, presence: true

  has_many :employees
end
