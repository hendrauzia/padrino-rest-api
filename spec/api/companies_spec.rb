require 'airborne_helper'

describe 'Company' do
  describe 'GET /api/companies' do
    before do
      create :company
      get '/api/companies'
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
