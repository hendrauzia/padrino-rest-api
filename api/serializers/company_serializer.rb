class CompanySerializer < ActiveModel::Serializer
  attributes *Company.column_names
end
