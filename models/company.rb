class Company < ActiveRecord::Base
  validates :name, :address, :city, :country, presence: true
end
