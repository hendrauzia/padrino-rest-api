class Api
  resource :passports do
    desc "Create a passport"
    params do
      use :passport
    end
    post do
      passport = declared(params).fetch('passport')

      employee = Employee.find(passport[:employee_id])
      upload   = Upload.create(file: passport[:file])

      Passport.create(employee: employee, upload: upload)
    end
  end
end
