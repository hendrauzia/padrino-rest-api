class Api
  resource :companies do
    desc "Retrieve all companies"
    get do
      Company.all
    end

    desc "Create a company"
    params do
      requires :name,    type: String, allow_blank: false
      requires :address, type: String, allow_blank: false
      requires :city,    type: String, allow_blank: false
      requires :country, type: String, allow_blank: false

      optional :email,   type: String, allow_blank: true
      optional :phone,   type: String, allow_blank: true
    end
    post do
      Company.create declared(params)
    end

    desc "Retrieve a company"
    get ':id' do
      Company.find params[:id]
    end
  end
end
