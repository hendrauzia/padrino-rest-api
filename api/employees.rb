class Api
  resource :employees do
    desc "Retrieve an employee"
    get ':id' do
      Employee.find params[:id]
    end
  end
end
