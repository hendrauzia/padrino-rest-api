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
end
