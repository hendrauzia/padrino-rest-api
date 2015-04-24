class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :position

  has_many :passports

  validates :name, presence: true
end
