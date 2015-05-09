class Company < ActiveRecord::Base
  has_paper_trail

  validates :name, :address, :city, :country, presence: true

  has_many :employees
end
