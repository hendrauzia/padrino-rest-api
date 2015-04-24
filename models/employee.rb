class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :position

  validates :name, presence: true
end
