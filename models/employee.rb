class Employee < ActiveRecord::Base
  has_paper_trail

  belongs_to :company
  belongs_to :position

  has_many :passports

  validates :name, presence: true
end
