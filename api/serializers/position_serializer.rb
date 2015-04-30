class PositionSerializer < ActiveModel::Serializer
  attributes *Position.column_names
end
