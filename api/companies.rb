class Api
  resource :companies do
    desc "Retrieve all companies"
    get do
      @companies = Company.all
      render rabl: 'companies/index'
    end

    desc "Create a company"
    params do
      use :company
    end
    post do
      Company.create declared(params).fetch('company')
    end

    desc "Retrieve a company"
    get ':id' do
      Company.find params[:id]
    end

    ['put', 'patch'].each do |method|
      desc "Update a company"
      params do
        use :company
      end
      send method, ':id' do
        company = Company.find params[:id]
        company.tap { |c| c.update declared(params).fetch('company') }
      end
    end
  end
end
