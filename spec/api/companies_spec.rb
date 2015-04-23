require 'airborne_helper'

describe '/api/companies' do
  describe 'GET /' do
    before do
      create :company
      get '/api/companies.json'
    end

    it 'returns array of company' do
      expect_json_types('*', {
        id:         :int,
        name:       :string,
        address:    :string,
        city:       :string,
        country:    :string,
        email:      :string_or_null,
        phone:      :string_or_null,
        created_at: :date,
        updated_at: :date
      })
    end
  end
end
