class CompanySerializer < ActiveModel::Serializer
  attributes *Company.column_names

  has_many :employees
end
