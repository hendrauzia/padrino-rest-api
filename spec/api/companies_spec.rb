require 'airborne_helper'

describe 'Company' do
  describe 'GET /api/companies' do
    before do
      company  = create :company
      position = create :position
      employee = create :employee, company: company, position: position

      get '/api/companies'
    end

    it 'returns array of company' do
      expect_json_types('companies.*', {
        id:         :int,
        name:       :string,
        address:    :string,
        city:       :string,
        country:    :string,
        email:      :string_or_null,
        phone:      :string_or_null,
        created_at: :date,
        updated_at: :date,
        employees:  :array
      })
    end

    include_examples "sideload-employees"
    include_examples "sideload-positions"
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
        company: {
          name:    data.name,
          address: data.address,
          city:    data.city,
          country: data.country,
          email:   data.email,
          phone:   data.phone
        }
      }
    end

    subject(:company) { Company.find_by_name(data.name) }

    it 'creates a company' do
      is_expected.to be_present
    end

    it 'returns company with id and timestamps' do
      expect_json(company: {
        id:         company.id,
        name:       data.name,
        address:    data.address,
        city:       data.city,
        country:    data.country,
        email:      data.email,
        phone:      data.phone,
        created_at: company.created_at.iso8601(3),
        updated_at: company.updated_at.iso8601(3),
        employees:  []
      })
    end
  end

  describe 'GET /api/companies/:id' do
    let(:name)     { 'Company Name by GET /api/companies/:id' }

    let!(:company)  { create :company, name: name }
    let!(:position) { create :position }
    let!(:employee) { create :employee, company: company, position: position }

    before do
      get "/api/companies/#{ company.id }"
    end

    it 'returns a company' do
      expect_json(company: { id: company.id, name: name, employees: [employee.id] })
    end

    include_examples "sideload-employees"
    include_examples "sideload-positions"
  end

  ['put', 'patch'].each do |method|
    describe "#{method.upcase} /api/companies/:id" do
      let(:name)    { "Company Name before #{method.upcase} /api/companies/:id" }
      let(:data)    {{
        company: {
          name: "Company Name after #{method.upcase} /api/companies/:id",
          address: Faker::Address.street_address,
          city:    Faker::Address.city,
          country: Faker::Address.country,
          phone:   Faker::PhoneNumber.phone_number,
          email:   Faker::Internet.email
        }
      }}

      let!(:company)  { create :company, name: name }
      let!(:position) { create :position }
      let!(:employee) { create :employee, company: company, position: position }

      before do
        send method, "/api/companies/#{ company.id }", data
      end

      it 'updates and return the company' do
        expect_json(company: { id: company.id, **data[:company], employees: [employee.id] })
      end

      include_examples "sideload-employees"
      include_examples "sideload-positions"
    end
  end
end
