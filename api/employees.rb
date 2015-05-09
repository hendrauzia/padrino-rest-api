class Api
  resource :employees do
    desc "Retrieve an employee"
    get ':id' do
      Employee.find params[:id]
    end

    desc "Create an employee"
    params do
      use :employee
    end
    post do
      Employee.create declared(params).fetch('employee')
    end
  end
end
