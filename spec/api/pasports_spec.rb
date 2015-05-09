require 'airborne_helper'

describe 'Passport' do
  describe 'POST /api/passports' do
    let!(:employee) { create :employee, :director }
    let!(:file)     { fixture_file_upload 'files/passport.pdf', 'application/pdf' }
    let!(:digest)   { Digest::SHA256.file(File.join(Padrino.root, 'spec/fixtures/files/passport.pdf')) }

    before do
      post "/api/passports", passport: {
        employee_id: employee.id,
        file: file
      }
    end

    after do
      system "rm -rf #{ File.join(Padrino.root, "public/uploads") }"
    end

    it 'creates the passport' do
      expect(employee.passports).to be_present
      expect(employee.passports.first.upload).to be_present
    end

    it 'uploads to local file system' do
      uploaded_digest = Digest::SHA256.file(File.join(Padrino.root, 'public', Passport.last.upload.file_url))
      expect(uploaded_digest).to eq digest
    end

    it 'return the passport' do
      expect_json_types(passport: {
        id: :int,
        employee_id: :int,
        upload_id: :int,
        upload_file_name: :string,
        upload_file_url: :string,
        created_at: :date,
        updated_at: :date
      });
    end
  end
end
