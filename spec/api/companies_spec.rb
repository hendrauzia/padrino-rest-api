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

  describe 'POST /api/companies' do
    let(:data) { OpenStruct.new(
      name:    'Company Name by POST /api/companies',
      address: Faker::Address.street_address,
      city:    Faker::Address.city,
      country: Faker::Address.country,
      email:   Faker::Internet.email,
      phone:   Faker::PhoneNumber.phone_number
    )}

    before do
      post '/api/companies', {
        name:    data.name,
        address: data.address,
        city:    data.city,
        country: data.country,
        email:   data.email,
        phone:   data.phone
      }
    end

    subject(:company) { Company.find_by_name(data.name) }

    it 'creates a company' do
      is_expected.to be_present
    end

    it 'returns company with id and timestamps' do
      expect_json({
        id:         company.id,
        name:       data.name,
        address:    data.address,
        city:       data.city,
        country:    data.country,
        email:      data.email,
        phone:      data.phone,
        created_at: company.created_at.iso8601(3),
        updated_at: company.updated_at.iso8601(3)
      })
    end
  end

  describe 'GET /api/companies/:id' do
    let(:name)    { 'Company Name by GET /api/companies/:id' }
    let(:company) { create :company, name: name }

    before do
      get "/api/companies/#{ company.id }"
    end

    it 'returns a company' do
      expect_json({ id: company.id, name: name })
    end
  end

  describe 'PATCH /api/companies/:id' do
    let(:name)    { 'Company Name before PATCH /api/companies/:id' }
    let(:company) { create :company, name: name }
    let(:data)    {{
      name: 'Company Name after PATCH /api/companies/:id',
      address: Faker::Address.street_address,
      city:    Faker::Address.city,
      country: Faker::Address.country,
      phone:   Faker::PhoneNumber.phone_number,
      email:   Faker::Internet.email
    }}

    before do
      patch "/api/companies/#{ company.id }", data
    end

    it 'updates and return the company' do
      expect_json({ id: company.id, **data })
    end
  end
end
