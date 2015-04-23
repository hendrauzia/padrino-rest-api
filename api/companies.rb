class Api
  resource :companies do
    get do
      Company.all
    end
  end
end
