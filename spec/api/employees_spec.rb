require 'airborne_helper'

describe 'Employees' do
  describe 'GET /api/employees/:id' do
    let(:name) { "Employee Name by GET /api/employees/:id" }

    let!(:position) { create :position }
    let!(:employee) { create :employee, name: name, position: position }

    let!(:file)     { fixture_file_upload 'files/passport.pdf', 'application/pdf' }
    let!(:upload)   { Upload.create(file: file) }
    let!(:passport) { Passport.create(employee: employee, upload: upload) }

    before do
      get "/api/employees/#{ employee.id }"
    end

    it 'returns an employee' do
      expect(employee: {
        id:          employee.id,
        name:        employee.name,
        position_id: employee.position_id,
        company_id:  employee.company_id
      })
    end

    include_examples "sideload-positions"
    include_examples "sideload-passports"
  end

  describe 'POST /api/employees' do
    let(:company)  { create :company }
    let(:position) { create :position }
    let(:data)     { OpenStruct.new(
      name: 'Employee Name by POST /api/employees',
      company_id: company.id,
      position_id: position.id
    )}

    before do
      post '/api/employees', {
        employee: {
          name: data.name,
          company_id: data.company_id,
          position_id: data.position_id
        }
      }
    end

    subject(:employee) { Employee.find_by_name(data.name) }

    it 'creates an employee' do
      is_expected.to be_present
    end

    it 'returns employee' do
      expect_json(employee: {
        id: employee.id,
        name: data.name,
        company_id: data.company_id,
        position_id: data.position_id
      })
    end
  end
end
