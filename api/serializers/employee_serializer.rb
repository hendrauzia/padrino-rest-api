class EmployeeSerializer < ActiveModel::Serializer
  attributes *Employee.column_names

  has_one  :position
  has_many :passports
end
