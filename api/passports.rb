class Api
  resource :passports do
    desc "Create a passport"
    post do
      employee = Employee.find(params[:employee_id])
      upload   = Upload.create(file: params[:file])
      passport = Passport.create(employee: employee, upload: upload)

      present passport.attributes
      present :upload_file_url, passport.upload.file_url
    end
  end
end
