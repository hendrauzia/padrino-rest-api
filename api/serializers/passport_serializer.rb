class PassportSerializer < ActiveModel::Serializer
  attributes *Passport.column_names, :upload_file_url

  def upload_file_url
    object.upload.file_url
  end
end
